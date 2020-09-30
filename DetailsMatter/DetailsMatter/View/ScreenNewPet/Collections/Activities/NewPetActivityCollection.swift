//
//  NewPetActivityCollection.swift
//  DetailsMatter
//
//  Created by José Mateus Azevedo on 30/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class NewPetActivityCollection: UICollectionView {

    private let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 120)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.minimumLineSpacing = CGFloat(8)
        return flow
    }()

    init() {
        super.init(frame: .zero, collectionViewLayout: layout)
        sharedInit()
    }

    required init?(coder: NSCoder) {
        super.init(frame: .zero, collectionViewLayout: layout)
        sharedInit()
    }

    private func sharedInit() {
        setupLayout()
        registerCell()
    }

    private func setupLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }

    private func registerCell() {
        let nibActivity = UINib(nibName: ActivityCellView.identifier, bundle: nil)
        self.register(nibActivity, forCellWithReuseIdentifier: ActivityCellView.identifier)
    }
}
