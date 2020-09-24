//
//  ActivityView+UITableViewDelegate+DataSource.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

//swiftlint:disable switch_case_alignment

extension ActivityView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            delegate?.showCategoryDetails()
        case 1:
            break
        case 2:
            delegate?.showRepeatDetails()
        case 3:
            delegate?.showStopRepeatDetails()
        default:
            print("selecionou ?")
        }
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}

extension ActivityView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Categoria"
                cell.detailTextLabel?.text = ActivityValues.categories[selectedOptionCategory ?? 0]
                cell.accessoryType = .disclosureIndicator
            case 1:
                let dateCell = DatePickerCell()
                dateCell.presenter = self
                return dateCell
            case 2:
                cell.textLabel?.text = "Repetir"
                cell.detailTextLabel?.text = ActivityValues.repeatOptions[selectedOptionRepeat ?? 0]
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.textLabel?.text = "Parar de repetir"
                cell.detailTextLabel?.text = ActivityValues.stopRepeat[selectedOptionStopRepeat ?? 0]
                cell.accessoryType = .disclosureIndicator
            default:
                break
        }

        return cell
    }
}
