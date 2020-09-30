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
}
