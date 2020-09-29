//
//  PetDetailsView.swift
//  DetailsMatter
//
//  Created by Ana Karolina Costa da Silva on 22/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit
// swiftlint:disable colon trailing_whitespace line_length
class PetDetailsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var newActivityButton : UIButton = {
        let button = UIButton()
        let mediumConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let imageSymbol = UIImage(systemName: "plus", withConfiguration: mediumConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.secondary, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.backgroundColor = .primary
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var newVaccineButton : UIButton = {
        let button = UIButton()
        let mediumConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let imageSymbol = UIImage(systemName: "plus", withConfiguration: mediumConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.secondary, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.backgroundColor = .primary
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupButtons() {
        self.addSubview(newActivityButton)
        self.addSubview(newVaccineButton)
//        nova vacina view
        newVaccineButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newVaccineButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        nova atividade view
        newActivityButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newActivityButton.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 0.5).isActive = true
    }
//    func setupStackNavigation() {
//
//    }
//
//    func SetupPetProfile(){
//
//    }
//
//    func SetupCardContainer() {
//
//    }
}
