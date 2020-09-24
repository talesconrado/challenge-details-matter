//
//  PetDetailsVaccineCell.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 23/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetDetailsVaccineCell: UICollectionViewCell {

    public static let identifier: String = "PetDetailsVaccineCell"

    // Create Outlets from Xib
    @IBOutlet weak var petPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Create configure function
    // public func configure(vaccine: VaccineModel) {}

}
