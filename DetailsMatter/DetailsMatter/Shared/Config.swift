//
//  Config.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class Config {
    private let initialController = InitialViewController()

    public func mainController() -> UIViewController {
        let nav = UINavigationController(rootViewController: initialController)
        nav.view.backgroundColor = .primaryLight
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.barTintColor = .primaryLight
        nav.navigationBar.tintColor = .secondary
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.08, green: 0.13, blue: 0.24, alpha: 1.00)
        ]
        return nav
    }
}
