//
//  PetDetailsActivitiesCell.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetDetailsActivityCell: UICollectionViewCell {

    public static let identifier: String = "PetDetailsActivityCell"

    // Create Outlets from Xib
    @IBOutlet weak var iconActivity: UIImageView!
    @IBOutlet weak var timeForActivity: UILabel!
    @IBOutlet weak var daysOfActivity: UILabel!
    @IBOutlet weak var activityDescription: UILabel!
    @IBOutlet weak var activityTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10

        self.iconActivity.layer.cornerRadius = 10
        self.iconActivity.backgroundColor = .white
    }

    // Create configure function
    
     public func configure(activity: ActivityModel) {
        activityDescription.text = activity.description
        activityTitle.text = activity.name
        let calendar = Calendar.current
        if let date = activity.startDate {
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            self.timeForActivity.text = "\(hour):\(minutes)"
        } else {
            self.timeForActivity.text = "00:00"
        }
     }
    
}
