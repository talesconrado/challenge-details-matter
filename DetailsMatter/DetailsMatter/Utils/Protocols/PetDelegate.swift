//
//  PetDelegate.swift
//  DetailsMatter
//
//  Created by Ana Karolina Costa da Silva on 28/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

protocol PetDelegate: AnyObject {
    func reloadActivityData()
    func reloadVaccineData()
}
