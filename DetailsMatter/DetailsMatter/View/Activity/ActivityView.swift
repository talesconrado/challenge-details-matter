//
//  ActivityView.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ActivityView: UIView {

    weak var delegate: ActivityDetailsDelegate?
    var selectedOptionRepeat: Int?
    var selectedOptionCategory: Int?
    var selectedOptionStopRepeat: Int?
    var selectedDate: Date?
    var dateString: String?

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

    lazy var descriptionTextField: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.systemFont(ofSize: 18)
        description.text = "Description"
        description.textColor = .lightGray
        self.addSubview(description)
        description.delegate = self
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
        frequencyTableView.register(DatePickerCell.self, forCellReuseIdentifier: "datePicker")
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
            descriptionTextField.widthAnchor.constraint(equalTo: readableContentGuide.widthAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 60)
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

extension ActivityView: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = .lightGray
        }
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .darkText
        if textView.text == "Description" {
            textView.text.removeAll()
        }
    }
}
