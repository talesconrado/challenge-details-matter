//
//  Initial.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 15/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class Initial: UIView {

    private let mascot: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 160, height: 130))
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let contentGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 100
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        return view
    }()

    private let newPetButton: UIButton = {
        let button = UIButtonWithIcon()
        button.backgroundColor = .primary
        button.setTitle("Novo Pet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.layer.cornerRadius = 17
        button.contentHorizontalAlignment = .center
        return button
    }()

    public let petsCollection: PetsCollection = {
        let collection = PetsCollection()
        return collection
    }()

    private let reminderLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    public let remindersCollection: RemindersCollection = {
        let collection = RemindersCollection()
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.backgroundColor = .primaryLight

        self.addSubview(contentGroup)
        contentGroup.translatesAutoresizingMaskIntoConstraints = false
        contentGroup.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentGroup.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentGroup.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
            constant: 30).isActive = true
        contentGroup.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        self.addSubview(mascot)
        mascot.translatesAutoresizingMaskIntoConstraints = false
        mascot.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        mascot.bottomAnchor.constraint(equalTo: contentGroup.topAnchor,
                                       constant: 40).isActive = true

        contentGroup.addSubview(newPetButton)
        newPetButton.translatesAutoresizingMaskIntoConstraints = false
        newPetButton.topAnchor.constraint(equalTo: contentGroup.topAnchor,
                                          constant: 40).isActive = true
        newPetButton.rightAnchor.constraint(equalTo: contentGroup.rightAnchor,
                                            constant: -16).isActive = true
        newPetButton.widthAnchor.constraint(equalToConstant: 120).isActive = true

        contentGroup.addSubview(petsCollection)
        petsCollection.translatesAutoresizingMaskIntoConstraints = false
        petsCollection.topAnchor.constraint(equalTo: newPetButton.bottomAnchor,
                                            constant: 25).isActive = true
        petsCollection.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor).isActive = true
        petsCollection.trailingAnchor.constraint(equalTo: contentGroup.trailingAnchor).isActive = true
        petsCollection.heightAnchor.constraint(equalToConstant: 155).isActive = true

        contentGroup.addSubview(reminderLabel)
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.topAnchor.constraint(equalTo: petsCollection.bottomAnchor,
                                           constant: 30).isActive = true
        reminderLabel.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor,
                                               constant: 16).isActive = true

        contentGroup.addSubview(remindersCollection)
        remindersCollection.translatesAutoresizingMaskIntoConstraints = false
        remindersCollection.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor,
                                                 constant: 16).isActive = true
        remindersCollection.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor).isActive = true
        remindersCollection.trailingAnchor.constraint(equalTo: contentGroup.trailingAnchor).isActive = true
        remindersCollection.bottomAnchor.constraint(equalTo: contentGroup.bottomAnchor).isActive = true
    }
}
