//
//  NewPetViewController.swift
//  DetailsMatter
//
//  Created by José Mateus Azevedo on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class NewPetViewController: UIViewController {
    
    @IBOutlet var vacineCollectionView: UICollectionView!
    @IBOutlet var activityCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        vacineCollectionView.delegate = self
        vacineCollectionView.dataSource = self
        activityCollectionView.delegate = self
        activityCollectionView.dataSource = self
        self.vacineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
        self.vacineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellIdentifier")
    }
}


extension NewPetViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var number = 0
        if collectionView == self.vacineCollectionView {
            number = 10
        }
        else if collectionView == self.activityCollectionView{
            number = 5
        }
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell? = nil
        if collectionView == self.vacineCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "vacineCollectionViewCell", for: indexPath)
        }
        else if collectionView == self.activityCollectionView{
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCollectionViewCell", for: indexPath)
        }
        return cell!
    }
    
    
}
