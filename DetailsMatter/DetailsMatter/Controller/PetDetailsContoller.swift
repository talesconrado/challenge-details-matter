//
//  PetDetailsContoller.swift
//  DetailsMatter
//
//  Created by Ana Karolina Costa da Silva on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

//swiftlint: disable : trailing_whitespace

import UIKit

class PetDetailsController: UIViewController {
    public var petModel: PetModel?
    public var vaccineData: [VaccineModel] = []
    public var activityData: [ActivityModel] = []
    private let activityRepo = DataManager.activity
    private let vaccineRepo = DataManager.vaccine
    @IBOutlet weak var vaccinesCollection: UICollectionView!
    @IBOutlet weak var activitiesCollection: UICollectionView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var ageIndicator: UILabel!
    @IBOutlet weak var weightIndicator: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.vaccinesCollection.dataSource = self
        self.vaccinesCollection.delegate = self

        self.activitiesCollection.dataSource = self
        self.activitiesCollection.delegate = self

        setupPetModel()
        loadDataSource()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .black

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit,
                                                            target: self, action: #selector(editPet))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    func loadDataSource() {
        vaccineData = vaccineRepo.filterByIds(from: petModel!.vaccinesIDs)
        activityData = activityRepo.filterByIds(from: petModel!.activitieIDs)
    }

    func setupPetModel() {
        if let petModel = petModel {
            petNameLabel.text = petModel.name
            ageIndicator.text = petModel.age
            weightIndicator.text = petModel.weight
            if let imageData = Data(base64Encoded: petModel.photo) {
                petImage.image = UIImage(data: imageData)
            } else {
                print("aqui nao tem nada")
                //default image
            }
        }
    }

    @objc func editPet() {
        print("Edit Tapped")
    }

    @IBAction func vaccineButton(_ sender: Any) {
        let newVaccine = UIStoryboard(name: "NewVaccine", bundle: nil)
        if let newVaccineController = newVaccine.instantiateViewController(
            withIdentifier: "NewVaccineStoryboard") as? NewVaccineViewController {
            newVaccineController.delegate = self
            guard let owner = self.petModel else {
                print("Details Pet Error - Owner")
                return
            }
            newVaccineController.owner = owner
            let nav = UINavigationController(rootViewController: newVaccineController)
            self.present(nav, animated: true, completion: nil)
        }
    }

    @IBAction func activityButton(_ sender: Any) {
        let activityController = ActivityController()
        activityController.owner = self.petModel
        activityController.delegate = self
        let nav = UINavigationController(rootViewController: activityController)
        self.present(nav, animated: true, completion: nil)
    }
}

extension PetDetailsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.vaccinesCollection {
            return vaccineData.count
        } else {
            return activityData.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.vaccinesCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDetailsVaccineCell.identifier,
            for: indexPath) as? PetDetailsVaccineCell
            else {
                fatalError("Unable to cast cell PetDetailsVaccineCell to UICollectionCell")
            }
            cell.configure(vaccine: vaccineData[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDetailsActivityCell.identifier,
                                                                for: indexPath) as? PetDetailsActivityCell
            else {
                fatalError("Unable to cast cell PetDetailsActivityCell to UICollectionCell")
            }
            cell.configure(activity: activityData[indexPath.row])
            return cell
        }
    }
}

extension PetDetailsController: PetDelegate {
    func reloadActivityData() {
        activityData = activityRepo.filterByIds(from: petModel!.activitieIDs)
        activitiesCollection.reloadData()
    }

    func reloadVaccineData() {
        vaccineData = vaccineRepo.filterByIds(from: petModel!.vaccinesIDs)
        vaccinesCollection.reloadData()
    }

}
