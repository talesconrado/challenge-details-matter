//
//  SceneDelegate.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 14/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene

        let config = Config()
        let rootController = config.mainController()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()

        let isFirstLaunch = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? true
        if isFirstLaunch {
            let onboardingController = OnboardingController()
            onboardingController.modalPresentationStyle = .overFullScreen
            rootController.present(onboardingController, animated: false, completion: nil)
        }
    }
}
