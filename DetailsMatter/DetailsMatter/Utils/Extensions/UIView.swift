//
//  UIView.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 06/10/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

extension UIView {
    func clearConstraints() {
        for constraint in self.constraints {
            self.removeConstraint(constraint)
        }
    }
}
