//
//  DataManager.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class ActivityRepository: Repository {
    typealias Item = ActivityModel
    var category: String = Category.activity.rawValue
}

class VaccineRepository: Repository {
    typealias Item = VaccineModel
    var category: String = Category.vaccine.rawValue
}

class PetRepository: Repository {
    typealias Item = PetModel
    var category: String = Category.pet.rawValue
}

struct DataManager {
    static let activity = ActivityRepository()
    static let vaccine = VaccineRepository()
    static let pet = PetRepository()
}
