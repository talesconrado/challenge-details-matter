//
//  Pet.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class PetModel: RepositoryItem {
    var identifier, name, age, weight: String
    var photo: String
    var activitieIDs, vaccinesIDs: [String]

    required init() {
        name = ""
        age = ""
        weight = ""
        photo = ""
        activitieIDs = []
        vaccinesIDs = []
        identifier = UUID().uuidString
    }
}
