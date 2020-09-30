//
//  InitialViewController.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

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
        reloadDS()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
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
        self.title = "Mioi Humano!"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupActions() {
        self.initial.newPetButton.addTarget(self, action: #selector(newPet), for: .touchUpInside)
    }

    @objc private func newPet() {
        let storyboard = UIStoryboard(name: "NewPet", bundle: nil)
        let newPetScreen = storyboard.instantiateViewController(withIdentifier: "NewPet")
        navigationController?.pushViewController(newPetScreen, animated: true)
    }

    @objc private func newVaccine() {
        let newVaccine = UIStoryboard(name: "NewVaccine", bundle: nil)
        let newVaccineController = newVaccine.instantiateViewController(withIdentifier: "NewVaccineStoryboard")
        let nav = UINavigationController(rootViewController: newVaccineController)
        self.present(nav, animated: true, completion: nil)
    }

    private func reloadDS() {
        self.petsDataSource = petRepository.readAllItems()

        if !self.petsDataSource.isEmpty {
            self.initial.setupPetsCollection()

            self.activitiesDataSource = activityRepository.getTodaysActivities()

            if !self.activitiesDataSource.isEmpty {
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

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.initial.petsCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetCollectionCell.identifier,
            for: indexPath) as? PetCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            let plainImage = petsDataSource[indexPath.row].photo
            cell.configure(imageString: plainImage)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ActivitiesCollectionCell.identifier,
                    for: indexPath) as? ActivitiesCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            cell.configure(activity: activitiesDataSource[indexPath.row])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.initial.petsCollection {
            let petDetails = UIStoryboard(name: "PetDetailsView", bundle: nil)
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
