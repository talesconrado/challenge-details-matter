//
//  ActivityView.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ActivityView: UIView {

    lazy var titleTextField: UITextField = {
        let title = UITextField()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.borderStyle = .none
        title.placeholder = "Título"
        title.textAlignment = .left
        self.addSubview(title)

        return title
    }()

    lazy var descriptionTextField: UITextField = {
        let description = UITextField()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.placeholder = "Descrição"
        description.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(description)

        return description
    }()

    lazy var frequencyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.addSubview(tableView)

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        setTitleLabelAndFieldConstraints()
        setDescriptionConstraints()
        setTableViewContrainsts()
    }

    func setTitleLabelAndFieldConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            titleTextField.rightAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.rightAnchor),
            titleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titleTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

    func setDescriptionConstraints() {
        NSLayoutConstraint.activate([
            descriptionTextField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 20),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            descriptionTextField.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor)
        ])
    }

    func setTableViewContrainsts() {
        NSLayoutConstraint.activate([
            frequencyTableView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 40),
            frequencyTableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            frequencyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
