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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vacineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        let nib = UINib(nibName: ActivityCellView.identifier, bundle: nil)
        setupNavBar()
        setupActionSheetCaller()
        activityCollectionView.register(nib, forCellWithReuseIdentifier: ActivityCellView.identifier)
        vacineCollectionView.delegate = self
        vacineCollectionView.dataSource = self
        activityCollectionView.delegate = self
        activityCollectionView.dataSource = self
    }
    
    @IBAction func saveNewPet(_ sender: Any) {
        if let newPet = DataManager.pet.createNewItem() {
            newPet.name = nameTextField.text!
            newPet.weight = weightTextField.text!
            newPet.age = ageTextField.text!
            DataManager.pet.update(item: newPet)
        }
    }
    @IBAction func addNewVacine(_ sender: Any) {
        
    }
    
    @IBAction func addNewActivity(_ sender: Any) {
        
    }
    
    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .primary
        navigationController?.navigationBar.topItem?.title = "Novo Pet"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain,
                                                            target: self, action: #selector(saveNewPet))
        navigationItem.rightBarButtonItem?.tintColor = .primary
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
            number = 10
        } else if collectionView == self.activityCollectionView {
            number = 5
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell? = nil
        if collectionView == self.vacineCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "vacineCollectionViewCell", for: indexPath) as UICollectionViewCell?
        } else if collectionView == self.activityCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCellView.identifier, for: indexPath) as? ActivityCellView as ActivityCellView?
        }
        return cell!
    }
}
