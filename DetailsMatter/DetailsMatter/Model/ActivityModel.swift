//
//  Activity.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

class ActivityModel: RepositoryItem {
    var identifier, name, description: String
    var startDate, repeating, stopRepeating: String

    required init() {
        self.name = ""
        self.description = ""
        self.startDate = ""
        self.repeating = ""
        self.stopRepeating = ""
        identifier = UUID().uuidString
    }
}
