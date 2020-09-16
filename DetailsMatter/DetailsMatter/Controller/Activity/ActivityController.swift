//
//  ActivityController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ActivityController: UIViewController {
    let contentView = ActivityView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavbarItems()
    }

    override func loadView() {
        view = contentView
    }

    func addNavbarItems() {
        title = "Nova Atividade"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                                 target: self,
                                                                                 action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                                                  target: self,
                                                                                  action: nil)
        navigationController?.navigationBar.tintColor = .orange
    }

}
