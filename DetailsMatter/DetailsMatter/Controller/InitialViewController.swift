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

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
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
}

extension InitialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.initial.petsCollection {
            return 5
        } else {
            return 10
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
            // cell.configure()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: ActivitiesCollectionCell.identifier,
                    for: indexPath) as? ActivitiesCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            // cell.configure()
            return cell
        }
    }
}
