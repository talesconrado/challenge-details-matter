//
//  PetDetailsContoller.swift
//  DetailsMatter
//
//  Created by Ana Karolina Costa da Silva on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetDetailsController: UIViewController {

    @IBOutlet weak var vaccinesCollection: UICollectionView!
    @IBOutlet weak var activitiesCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()

        self.vaccinesCollection.dataSource = self
        self.vaccinesCollection.delegate = self

        self.activitiesCollection.dataSource = self
        self.activitiesCollection.delegate = self
    }

    @IBAction func vaccineButton(_ sender: Any) {
        let newVaccine = UIStoryboard(name: "NewVaccine", bundle: nil)
        let newVaccineController = newVaccine.instantiateViewController(withIdentifier: "NewVaccineStoryboard")
        let nav = UINavigationController(rootViewController: newVaccineController)
        self.present(nav, animated: true, completion: nil)
    }

    @IBAction func activityButton(_ sender: Any) {
        // Code to call "Create Activity" screen
    }

    private func registerCells() {
        let vaccineNib = UINib(nibName: PetDetailsVaccineCell.identifier, bundle: nil)
        self.vaccinesCollection.register(vaccineNib, forCellWithReuseIdentifier: PetDetailsVaccineCell.identifier)

        let activityNib = UINib(nibName: PetDetailsActivityCell.identifier, bundle: nil)
        self.activitiesCollection.register(activityNib, forCellWithReuseIdentifier: PetDetailsActivityCell.identifier)
    }
}

extension PetDetailsController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.vaccinesCollection {
            return 5
        } else {
            return 10
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
            // cell.configure()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetDetailsActivityCell.identifier,
                                                                for: indexPath) as? PetDetailsActivityCell
            else {
                fatalError("Unable to cast cell PetDetailsActivityCell to UICollectionCell")
            }
            // cell.configure()
            return cell
        }
    }
}
