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
        
        let repo = Database.activity
        let created = repo.createNewItem()
        print(created?.identifier)
        var readed = (repo.readItem(identifier: created!.identifier))
        print(readed?.description)
        print(readed?.identifier)
        readed?.description = "Testando repository"
        repo.update(item: readed!)
        readed = (repo.readItem(identifier: created!.identifier))
        print(readed?.description)
        print(readed?.identifier)
        print(repo.readAllItems())
        present(navigation, animated: true, completion: nil)
    }

}
