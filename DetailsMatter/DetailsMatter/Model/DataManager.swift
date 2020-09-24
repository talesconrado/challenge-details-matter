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
    var category: Category = .activity
}
class VaccineRepository: Repository {
    typealias Item = VaccineModel
    var category: Category = .vaccine
}
class PetRepository: Repository {
    typealias Item = PetModel
    var category: Category = .pet
}

struct DataManager {
    static let activity = ActivityRepository()
    static let vaccine = VaccineRepository()
    static let pet = PetRepository()
}

