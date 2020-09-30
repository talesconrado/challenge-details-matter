//
//  OnboardingController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 30/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {
    lazy var contentView: OnboardingView = {
        let view = OnboardingView(presenter: self)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = contentView
    }

    func askForPermission() {
        print()
    }

    func showInitialScreen() {
        let initialScreen = InitialViewController()
        initialScreen.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(initialScreen, animated: true)
    }
}
