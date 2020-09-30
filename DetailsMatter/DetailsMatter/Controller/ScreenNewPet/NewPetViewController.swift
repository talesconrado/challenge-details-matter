//
//  NewPetViewController.swift
//  DetailsMatter
//
//  Created by José Mateus Azevedo on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

//swiftlint:disable force_cast

import UIKit

class NewPetViewController: UIViewController {

    @IBOutlet var vacineCollectionView: UICollectionView!
    @IBOutlet var activityCollectionView: UICollectionView!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var petImage: UIImageView!

    private var petModel: PetModel?
    private let petRepository = DataManager.pet
    private let vaccineRepository = DataManager.vaccine
    private let activityRepository = DataManager.activity

    private var vaccineData: [VaccineModel] = []
    private var activityData: [ActivityModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        setupNavBar()
        setupActionSheetCaller()
        vacineCollectionView.delegate = self
        vacineCollectionView.dataSource = self
        activityCollectionView.delegate = self
        activityCollectionView.dataSource = self
    }

    private func setupModel() {
        petModel = petRepository.createNewItem()
    }

    @IBAction func saveNewPet(_ sender: Any) {
        if let newPet = petModel {
            newPet.name = nameTextField.text!
            newPet.weight = weightTextField.text!
            newPet.age = ageTextField.text!
            DataManager.pet.update(item: newPet)
        }
    }
    @IBAction func addNewVacine(_ sender: Any) {
        let newVaccine = UIStoryboard(name: "NewVaccine", bundle: nil)
        let newVaccineController = newVaccine.instantiateViewController(withIdentifier: "NewVaccineStoryboard")
        let nav = UINavigationController(rootViewController: newVaccineController)
        self.present(nav, animated: true, completion: nil)
    }

    @IBAction func addNewActivity(_ sender: Any) {
        let newActivityController = ActivityController()
        let nav = UINavigationController(rootViewController: newActivityController)
        newActivityController.owner = petModel
        self.present(nav, animated: true)
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.topItem?.title = "Novo Pet"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain,
                                                            target: self, action: #selector(saveNewPet))
        navigationItem.rightBarButtonItem?.tintColor = .secondary
    }

    private func petImageConfig() {
        self.petImage.layer.cornerRadius = 30
        self.petImage.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    private func setupActionSheetCaller() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.displayActionSheet))
        tap.numberOfTouchesRequired = 1
        self.petImage.addGestureRecognizer(tap)
        self.petImage.isUserInteractionEnabled = true
    }

    @objc private func displayActionSheet() {
            let optionalMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

            let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default, handler: importPicture)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

            optionalMenu.addAction(choosePhoto)
            optionalMenu.addAction(cancel)

            self.present(optionalMenu, animated: true, completion: nil)
        }

}

extension NewPetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        petImage.image = image
        dismiss(animated: true, completion: nil)
    }

    func importPicture(alert: UIAlertAction) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}

extension NewPetViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number = 0
        if collectionView == self.vacineCollectionView {
            number = vaccineData.count
        } else if collectionView == self.activityCollectionView {
            number = activityData.count
        }
        return number
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.vacineCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: VaccineCellView.identifier,
                for: indexPath) as? VaccineCellView
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            cell.configure(vaccine: vaccineData[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ActivityCellView.identifier,
                for: indexPath) as? ActivityCellView
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            cell.configure(activity: activityData[indexPath.row])
            return cell
        }
    }
}

extension NewPetViewController: PetDelegate {
    func reloadActivityData() {
        if let petModel = self.petModel {
            self.activityData = activityRepository.filterByIds(from: petModel.activitieIDs)
        }
    }

    func reloadVaccineData() {
        if let petModel = self.petModel {
            self.vaccineData = vaccineRepository.filterByIds(from: petModel.vaccinesIDs)
        }
    }
}
