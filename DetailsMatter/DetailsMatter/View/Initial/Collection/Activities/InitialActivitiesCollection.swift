//
//  InitialActivitiesCollection.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class InitialActivitiesCollection: UICollectionView {

    private let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: UIScreen.main.bounds.width - 32, height: 66)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.minimumLineSpacing = CGFloat(8)
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
            self.showsVerticalScrollIndicator = false
        }

        private func registerCell() {
            let remindersNib = UINib(nibName: InitialActivityCollectionCell.identifier, bundle: nil)
            self.register(remindersNib, forCellWithReuseIdentifier: InitialActivityCollectionCell.identifier)
        }
}
