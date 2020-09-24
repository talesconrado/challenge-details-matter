//
//  RepositoryItem.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 22/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

protocol RepositoryItem: Codable {
    var identifier: String { get }
    init()
}
