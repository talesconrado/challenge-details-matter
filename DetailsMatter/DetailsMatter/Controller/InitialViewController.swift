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
    }

    override func loadView() {
        super.loadView()
        view = self.initial

        self.initial.petsCollection.dataSource = self
        self.initial.petsCollection.delegate = self

        self.initial.remindersCollection.dataSource = self
        self.initial.remindersCollection.delegate = self
    }

    private func setupNavBar() {
        self.title = "Mioi Humano!"
        navigationController?.navigationBar.prefersLargeTitles = true
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReminderCollectionCell.identifier,
                                                                for: indexPath) as? ReminderCollectionCell
            else {
                fatalError("Unable to cast cell ActivityCell to UICollectionCell")
            }
            // cell.configure()
            return cell
        }
    }
}
