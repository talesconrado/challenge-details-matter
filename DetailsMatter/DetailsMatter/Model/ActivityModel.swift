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
    var startDate, stopRepeating: Date?
    var repeating, category: Int
    var reminderID: String?

    required init() {
        self.name = ""
        self.description = ""
        self.startDate = Date()
        self.repeating = 0
        self.category = 0
        self.stopRepeating = Date.distantFuture
        identifier = UUID().uuidString
    }
}
