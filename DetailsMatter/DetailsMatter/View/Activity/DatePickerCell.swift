//
//  DatePickerCell.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 18/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class DatePickerCell: UITableViewCell {
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Início"
        self.addSubview(label)
        
        return label
    }()

    lazy var date: UITextField = {
        let date = UITextField()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.tintColor = .clear
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        date.inputView = picker
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.detailTextLabel?.text = dateFormatter.string(from: picker.date)
        self.addSubview(date)

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
            
            date.rightAnchor.constraint(equalTo: leftAnchor, constant: -30),
            date.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
