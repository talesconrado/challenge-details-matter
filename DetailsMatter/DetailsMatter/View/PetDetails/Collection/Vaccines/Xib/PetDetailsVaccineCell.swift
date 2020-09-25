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

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
    }

    // Create configure function
    // public func configure(vaccine: VaccineModel) {}

}
