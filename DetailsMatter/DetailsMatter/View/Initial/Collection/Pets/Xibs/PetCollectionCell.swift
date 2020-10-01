//
//  PetCollectionCell.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class PetCollectionCell: UICollectionViewCell {

    public static let identifier: String = "PetCollectionCell"

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.imageView.backgroundColor = .secondary
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.cornerRadius = 10
        self.imageView.image = UIImage(named: "petDefault")
    }

    public func configure(imageString: String) {
        if let data = Data(base64Encoded: imageString) {
            self.imageView.image = UIImage(data: data)
        } else {
            self.imageView.image = UIImage(named: "petDefault")
        }
    }
}
