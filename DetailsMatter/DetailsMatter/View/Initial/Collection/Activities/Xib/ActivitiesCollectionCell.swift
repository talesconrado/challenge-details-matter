//
//  ReminderCollectionCell.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class ActivitiesCollectionCell: UICollectionViewCell {

    public static let identifier: String = "ActivitiesCollectionCell"

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var activityCard: UIView!
    @IBOutlet weak var activityIcon: UIImageView!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDescription: UILabel!

    override func draw(_ rect: CGRect) {
        self.activityCard.layer.cornerRadius = 10
        self.activityCard.backgroundColor = .secondary

        self.activityIcon.layer.cornerRadius = 10
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func configure(activity: ActivityModel) {
        let calendar = Calendar.current
        //let formatter = DateFormatter()

        if let date = activity.startDate {
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            self.timeLabel.text = "\(hour):\(minutes)"
        } else {
            self.timeLabel.text = "00:00"
        }

        self.activityTitle.text = activity.name
        self.activityDescription.text = activity.description
    }
}
