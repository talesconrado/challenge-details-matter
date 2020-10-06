//
//  Config.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

//

enum CurrentlyTesting {
    case initialController
    case onboardingController
}

class Config {
    private let initialController = InitialViewController()
    private let onboardingController = OnboardingController()

    public func mainController(_ controller: CurrentlyTesting) -> UIViewController {
        var viewController: UIViewController

        switch controller {
        case .initialController:
            viewController = initialController
        case .onboardingController:
            viewController = onboardingController
        }

        let nav = UINavigationController(rootViewController: viewController)
        nav.navigationBar.prefersLargeTitles = true
        nav.navigationBar.isTranslucent = true
        nav.navigationBar.shadowImage = UIImage()
        nav.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold),
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.08, green: 0.13, blue: 0.24, alpha: 1.00)
        ]
        return nav
    }
}
