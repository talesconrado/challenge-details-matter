//
//  Vaccine.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class VaccineModel: RepositoryItem {
    var identifier: String
    var name, date: String

    required init() {
        identifier = UUID().uuidString
        name = ""
        date = ""
    }
}
