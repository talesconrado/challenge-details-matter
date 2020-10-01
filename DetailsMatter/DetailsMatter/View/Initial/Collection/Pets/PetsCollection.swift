//
//  PetsCollection.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetsCollection: UICollectionView {

    private let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        let itemSize = UIScreen.main.bounds.width * 0.35
        flow.itemSize = CGSize(width: itemSize, height: itemSize)
        flow.minimumInteritemSpacing = CGFloat(16)
        flow.minimumLineSpacing = CGFloat(16)
        flow.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return flow
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        setupLayout()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
    }

    private func registerCell() {
        let petsNib = UINib(nibName: PetCollectionCell.identifier, bundle: nil)
        self.register(petsNib, forCellWithReuseIdentifier: PetCollectionCell.identifier)
    }
}
