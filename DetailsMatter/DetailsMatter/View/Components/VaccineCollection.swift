//
//  VaccineCollection.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 25/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class VaccineCollection: UICollectionView {

    private let layout: UICollectionViewFlowLayout = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.itemSize = CGSize(width: 100, height: 100)
        flow.minimumInteritemSpacing = CGFloat(8)
        flow.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        return flow
    }()

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 116),
                   collectionViewLayout: layout)
        sharedInit()
    }

    required init?(coder: NSCoder) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 116),
                   collectionViewLayout: layout)
        sharedInit()
    }

    private func sharedInit() {
        setupLayout()
        registerCell()
    }

    private func setupLayout() {
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        self.heightAnchor.constraint(equalToConstant: 116).isActive = true
    }

    private func registerCell() {
        let vaccineNib = UINib(nibName: VaccineCollectionCell.identifier, bundle: nil)
        self.register(vaccineNib, forCellWithReuseIdentifier: VaccineCollectionCell.identifier)
    }
}
