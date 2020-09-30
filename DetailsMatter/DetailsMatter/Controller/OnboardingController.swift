//
//  OnboardingController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 30/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

    let contentView = OnboardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = contentView
    }

}
