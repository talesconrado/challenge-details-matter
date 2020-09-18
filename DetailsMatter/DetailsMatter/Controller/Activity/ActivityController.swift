//
//  ActivityController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ActivityController: UIViewController {

    var selectedRepeat: Int?
    var selectedCategory: Int?

    lazy var contentView: ActivityView = {
        let view = ActivityView()
        view.delegate = self
        view.selectedOptionRepeat = self.selectedRepeat
        return view
    }()

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
        navigationController?.navigationBar.tintColor = .primary
    }
}

// MARK: ActivityDetailsDelegate

extension ActivityController: ActivityDetailsDelegate {
    func showRepeatDetails() {
        let repeatDetailsController = RepeatDetailsController()
        repeatDetailsController.selected = selectedRepeat
        repeatDetailsController.delegate = self
        navigationController?.pushViewController(repeatDetailsController, animated: true)
    }

    func didChangeSelectedRepeatOption(option: Int) {
        selectedRepeat = option
        contentView.selectedOptionRepeat = selectedRepeat
        contentView.frequencyTableView.reloadData()
    }

    func showCategoryDetails() {
        let categoryDetailsController = CategoryDetailsController()
        categoryDetailsController.selected = selectedCategory
        categoryDetailsController.delegate = self
        navigationController?.pushViewController(categoryDetailsController, animated: true)
    }

    func didChangeSelectedCategoryOption(option: Int) {
        selectedCategory = option
        contentView.selectedOptionCategory = selectedCategory
        contentView.frequencyTableView.reloadData()
    }
}
