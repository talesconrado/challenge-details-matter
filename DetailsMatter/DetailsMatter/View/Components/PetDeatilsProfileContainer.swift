//
//  PetDeatilsProfileContainer.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 25/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetDeatilsProfileContainer: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }

    private func sharedInit() {
        backgroundColor = .primaryLight
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
