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
        self.initial.newPetButton.addTarget(self, action: #selector(newVaccine), for: .touchUpInside)
    }

    @objc private func newVaccine() {
        let newVaccine = UIStoryboard(name: "NewVaccine", bundle: nil)
        let newVaccineController = newVaccine.instantiateViewController(withIdentifier: "NewVaccineStoryboard")
        let nav = UINavigationController(rootViewController: newVaccineController)
        self.present(nav, animated: true, completion: nil)
    }

    private func reloadDS() {
        self.petsDataSource = petRepository.readAllItems()

        if self.petsDataSource.isEmpty {
            self.initial.setupPetsCollection()
        }

        let today = Date()
        let allActivities = activityRepository.readAllItems()
        let todaysActivities = allActivities.filter { ($0.startDate! ... $0.stopRepeating!).contains(today) }
        self.activitiesDataSource = todaysActivities

        if !self.activitiesDataSource.isEmpty {
            print(activitiesDataSource)
            self.initial.showActivitiesCollection()
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
}
