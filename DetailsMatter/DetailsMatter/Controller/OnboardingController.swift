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

    func showInitialScreen() {
        self.dismiss(animated: true, completion: {
            UserDefaults.standard.set(false, forKey: "FirstLaunch")
        })
    }

    func askForNotificationPermission() {
        let event = EventManager()
        event.requestAccess {
            DispatchQueue.main.async {
                self.contentView.collectionView.scrollToItem(at: IndexPath(row: 2, section: 0),
                                                        at: .centeredHorizontally,
                                                        animated: true)
            }
        }
    }
}
