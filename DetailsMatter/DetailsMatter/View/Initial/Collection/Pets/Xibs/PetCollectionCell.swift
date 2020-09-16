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
        self.imageView.backgroundColor = .secondary
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.layer.cornerRadius = 10
    }

//    private func loadvViewFromNib() -> UIView? {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: PetCollectionCell.identifier, bundle: bundle)
//        return nib.instantiate(withOwner: self, options: nil).first as? UIView
//    }
//
//    private func setupXib() {
//        guard let view = loadvViewFromNib() else { fatalError("Wrong xib name") }
//        view.frame = self.bounds
//    }

//    public func configure(imageName: String) {
//        self.imageView.image = UIImage(named: imageName)
//    }
}
