//
//  RepeatDetails.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class RepeatDetails: UIView {

    weak var delegate: ActivityDetailsDelegate?

    var selectedOption: Int = 0 {
        didSet {
            delegate?.didChangeSelectedRepeatOption(option: selectedOption)
        }
    }

    lazy var tableView: UITableView = {
        let tbv = UITableView(frame: .zero, style: .grouped)
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.tableFooterView = UIView()
        tbv.delegate = self
        tbv.dataSource = self
        self.addSubview(tbv)

        return tbv
    }()

    let cellNames: [String] = ActivityValues.repeatOptions

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Error at init of RepeatDetails view.")
    }

    func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

// MARK: TableView DataSource

extension RepeatDetails: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = cellNames[indexPath.row]
        cell.selectionStyle = .none
        cell.tintColor = .primary
        if indexPath.row == selectedOption {
            cell.accessoryType = .checkmark
        }

        return cell
    }

}

// MARK: TableView Delegate

extension RepeatDetails: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        self.selectedOption = indexPath.row
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }

    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .systemGray5
    }

    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = .white
    }
}
