//
//  DetailsView.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 18/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

enum DetailType {
    case categoryDetails
    case repeatDetails
}

class DetailsView: UIView {

    var size: Int?
    var type: DetailType?
    weak var delegate: ActivityDetailsDelegate?

    var selectedOption: Int = 0 {
        didSet {
            switch type {
            case .categoryDetails:
                delegate?.didChangeSelectedCategoryOption(option: selectedOption)
            case .repeatDetails:
                delegate?.didChangeSelectedRepeatOption(option: selectedOption)
            default:
                print("Type not set")
            }
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

    lazy var cellNames: [String] = {
        switch type {
        case .categoryDetails:
            return ActivityValues.categories
        case .repeatDetails:
            return ActivityValues.repeatOptions
        default:
            return []
        }
    }()

    convenience init(size: Int, type: DetailType) {
        self.init()
        self.size = size
        self.type = type
        setTableViewConstraints()
    }

    func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

// MARK: TableView DataSource

extension DetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let size = size else {
            return 0
        }
        return size
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

extension DetailsView: UITableViewDelegate {
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

