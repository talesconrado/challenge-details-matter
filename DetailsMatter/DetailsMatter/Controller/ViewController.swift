//
//  ViewController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 14/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var testButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Nova Atividade", for: .normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(showActivityModal), for: .touchUpInside)

        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        positionTestButton()
    }

    func positionTestButton() {
        NSLayoutConstraint.activate([
            testButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            testButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    @objc func showActivityModal() {
        let activityVC = ActivityController()
        let navigation = UINavigationController(rootViewController: activityVC)
        present(navigation, animated: true, completion: nil)
    }

}
