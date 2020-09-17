//
//  ActivityDetailsDelegate.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

protocol ActivityDetailsDelegate: class {
    func showRepeatDetails()
    func didChangeSelectedRepeatOption(option: Int)
}
