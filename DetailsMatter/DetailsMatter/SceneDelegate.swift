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

        let config = Config()
        var navigation: UIViewController

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        //Change this function to call the controller you are currently testing
        let isFirstLaunch = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? false
        if !isFirstLaunch {
            UserDefaults.standard.set(true, forKey: "FirstLaunch")
            navigation = config.mainController(.onboardingController)
        } else {
            navigation = config.mainController(.onboardingController)
        }

        window?.rootViewController = navigation

        window?.makeKeyAndVisible()
    }
}
