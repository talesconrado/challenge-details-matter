//
//  DatePickerCell.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 18/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class DatePickerCell: UITableViewCell {
    
    weak var presenter: ActivityView?

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Início"
        self.contentView.addSubview(label)

        return label
    }()

    lazy var date: UITextField = {
        let date = UITextField()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.textColor = .gray

        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .dateAndTime

        date.inputView = picker
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        date.delegate = self
        date.text = dateFormatter.string(from: picker.date)
        picker.addTarget(self, action: #selector(pickerDone), for: .valueChanged)
        self.contentView.addSubview(date)

        return date
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            date.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            date.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension DatePickerCell: UITextFieldDelegate {
    @objc func pickerDone() {
        if let datePicker = self.date.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .medium
            dateformatter.timeStyle = .short
            self.date.text = dateformatter.string(from: datePicker.date)
            
            presenter?.selectedDate = datePicker.date
        }
    }
}
