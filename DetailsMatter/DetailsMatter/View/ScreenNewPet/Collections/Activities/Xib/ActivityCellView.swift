//
//  ActivityCellView.swift
//  DetailsMatter
//
//  Created by José Mateus Azevedo on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import Foundation

import UIKit
class ActivityCellView: UICollectionViewCell {

    static let identifier: String = "ActivityCell"
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var frequencyLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    @IBOutlet var scheduleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.icon.layer.cornerRadius = 10
        self.icon.backgroundColor = .white
    }

    public func configure(activity: ActivityModel) {
       commentLabel.text = activity.description
       activityLabel.text = activity.name
       let calendar = Calendar.current
       if let date = activity.startDate {
           let hour = calendar.component(.hour, from: date)
           let minutes = calendar.component(.minute, from: date)
           self.scheduleLabel.text = "\(hour):\(minutes)"
       } else {
           self.scheduleLabel.text = "00:00"
       }
    }
}
