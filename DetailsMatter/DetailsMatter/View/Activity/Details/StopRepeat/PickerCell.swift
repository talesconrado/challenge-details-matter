//
//  PickerCell.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PickerCell: UITableViewCell {

    weak var presenter: StopRepeatDetails?

    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.backgroundColor = .clear
        self.contentView.addSubview(picker)
        picker.addTarget(self, action: #selector(pickerDone), for: .valueChanged)
        return picker
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func pickerDone() {
        presenter?.selectedOption = 1
        presenter?.delegate?.didChangeSelectedStopRepeatOption(option: 1, date: datePicker.date)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            datePicker.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}
