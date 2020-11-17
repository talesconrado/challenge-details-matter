//
//  InitialViewController.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.

import UIKit

class InitialViewController: UIViewController {

    private let initial = Initial()

    private let petRepository = DataManager.pet
    private let activityRepository = DataManager.activity

    private var petsDataSource: [PetModel] = []
    private var activitiesDataSource: [ActivityModel] = []

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
        loadDS()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }

    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            self.title = ""
    }


    override func loadView() {
        super.loadView()
        view = self.initial

        self.initial.petsCollection.dataSource = self
        self.initial.petsCollection.delegate = self

        self.initial.activitiesCollection.dataSource = self
        self.initial.activitiesCollection.delegate = self
    }

    private func setupNavBar() {
        let preference = (UserDefaults.standard.value(forKey: "DogLover") as? Bool) ?? false
        if preference {
            self.title = "Olá, Aumigo!"
        } else {
            self.title = "Mioi, Humano!"
        }
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupActions() {
        self.initial.newPetButton.addTarget(self, action: #selector(newPet), for: .touchUpInside)
    }

    @objc private func newPet() {
        let storyboard = UIStoryboard(name: "NewPet", bundle: nil)
        let newPetScreen = storyboard.instantiateViewController(withIdentifier: "NewPetStoryboard")
        navigationController?.pushViewController(newPetScreen, animated: true)
    }

    private func loadDS() {
        self.reloadPets()
        if petsDataSource.isEmpty {
            self.initial.nothingToShow()
        } else {
            self.initial.showPetsCollection()
            self.reloadTodaysActivities()
            if activitiesDataSource.isEmpty {
                self.initial.noTasksForToday()
            } else {
                print(activitiesDataSource.count)
                self.initial.showActivitiesCollection()
            }
        }
    }
}

extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.initial.petsCollection {
            return petsDataSource.count
        } else {
            return activitiesDataSource.count
        }
    }

    @objc func deletePetAlert(sender: UILongPressGestureRecognizer) {
        // swiftlint:disable force_cast
        let seletedCell = sender.view! as! UICollectionViewCell
        // swiftlint:enable force_cast
        let indexPath = initial.petsCollection.indexPath(for: seletedCell)
        let alert = UIAlertController(title: "Aviso",
                                      message: "Você irá deletar esse pet!",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Deletar", style: UIAlertAction.Style.destructive, handler: { _ in
            self.deletePet(indexPath!)
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }

    func deletePet(_ indexPath: IndexPath) {
        let deletedPetID = petsDataSource[indexPath.row].identifier
        self.petRepository.delete(identifier: deletedPetID)
        self.petsDataSource.remove(at: indexPath.row)
        self.initial.petsCollection.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let tapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.deletePetAlert))
        if collectionView == self.initial.petsCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetCollectionCell.identifier,
                                                                for: indexPath) as? PetCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            cell.configure(pet: petsDataSource[indexPath.row])
            cell.addGestureRecognizer(tapGestureRecognizer)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: InitialActivityCollectionCell.identifier,
                    for: indexPath) as? InitialActivityCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            cell.configure(activity: activitiesDataSource[indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.initial.petsCollection {
            let petDetails = UIStoryboard(name: "PetDetails", bundle: nil)
            if let petDetailsController = petDetails.instantiateViewController(
                withIdentifier: "PetDetailsStoryboard") as? PetDetailsController {
                petDetailsController.petModel = petsDataSource[indexPath.row]
                self.navigationController?.pushViewController(petDetailsController, animated: true)
            } else {
                print("InitialViewCotroller Error - Wrong Storyboard Identifier")
            }
        }
    }
}

extension InitialViewController: InitialDelegate {
    func reloadPets() {
        self.petsDataSource = petRepository.readAllItems()
        self.initial.petsCollection.reloadData()
    }

    func reloadTodaysActivities() {
        self.activitiesDataSource = activityRepository.getTodaysActivities()
        self.initial.activitiesCollection.reloadData()
    }
}
