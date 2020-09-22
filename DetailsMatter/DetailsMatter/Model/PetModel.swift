//
//  Pet.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct PetModel: Codable {
    let identifier, name, age, weight: String
    let photo: String
    let activitieIDs, vaccinesIDs: [String]
}
