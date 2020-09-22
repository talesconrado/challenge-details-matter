//
//  Activity.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

struct ActivityModel: Codable {
    let identifier, title, description: String
    let startDate, repeating, stopRepeating: String
}
