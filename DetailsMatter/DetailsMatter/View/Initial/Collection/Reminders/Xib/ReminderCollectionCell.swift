//
//  ReminderCollectionCell.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ReminderCollectionCell: UICollectionViewCell {

    public static let identifier: String = "ReminderCollectionCell"

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var reminderCard: UIView!
    @IBOutlet weak var reminderIcon: UIImageView!
    @IBOutlet weak var reminderTitle: UILabel!
    @IBOutlet weak var reminderDescription: UILabel!

    override func draw(_ rect: CGRect) {
        self.reminderCard.layer.cornerRadius = 10
        self.reminderCard.backgroundColor = .secondary

        self.reminderIcon.layer.cornerRadius = 10
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    public func configure() {}
}
