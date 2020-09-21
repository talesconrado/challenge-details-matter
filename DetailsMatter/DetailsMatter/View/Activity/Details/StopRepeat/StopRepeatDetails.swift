//
//  StopRepeatDetails.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class StopRepeatDetails: DetailsView {

    var datePickerIndexPath: IndexPath?
    var stopRepeatDate: Date?

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if datePickerIndexPath != nil {
            return 3
        }
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        if datePickerIndexPath == indexPath {
            let pickerCell = PickerCell()
            pickerCell.datePicker.date = stopRepeatDate ?? Date()
            pickerCell.presenter = self
            return pickerCell
        } else {
            cell.textLabel?.text = cellNames[indexPath.row]
            cell.selectionStyle = .none
            cell.tintColor = .primary
            if indexPath.row == selectedOption {
                cell.accessoryType = .checkmark
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        self.selectedOption = indexPath.row

        if let datePickerIndexPath = datePickerIndexPath, indexPath.row == 0 {
            tableView.deleteRows(at: [datePickerIndexPath], with: .top)
            self.datePickerIndexPath = nil
        } else {
            if datePickerIndexPath == nil, indexPath.row == 1 {
                datePickerIndexPath = IndexPath(row: 2, section: 0)
                tableView.insertRows(at: [datePickerIndexPath!], with: .top)
            }
        }
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let datePicker = datePickerIndexPath, datePicker == indexPath {
            return 260
        }
        return 44
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let datePicker = datePickerIndexPath, datePicker == indexPath {
            return 260
        }
        return 44
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}
