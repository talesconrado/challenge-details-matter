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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let contentGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 100
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        return view
    }()

    public let newPetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.setTitle("Novo Pet", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.black, for: .normal)
        let mediumConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let imageSymbol = UIImage(systemName: "plus", withConfiguration: mediumConfiguration)
        let imageSymbolNew = imageSymbol?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(imageSymbolNew, for: .normal)
        button.contentHorizontalAlignment = .left
        button.layer.cornerRadius = 17
        button.contentHorizontalAlignment = .center
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 33).isActive = true
        return button
    }()

    private let nothingToshow: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "nothingToShow")
        return imageView
    }()

    private let noTasks: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "noTasksForToday")
        return imageView
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

    public let activitiesCollection: ActivitiesCollection = {
        let collection = ActivitiesCollection()
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
        let frameWidth = UIScreen.main.bounds.width * 0.35
        mascot.widthAnchor.constraint(equalToConstant: frameWidth).isActive = true

        contentGroup.addSubview(nothingToshow)
        nothingToshow.translatesAutoresizingMaskIntoConstraints = false
        nothingToshow.centerYAnchor.constraint(equalTo: contentGroup.centerYAnchor, constant: -50).isActive = true
        nothingToshow.centerXAnchor.constraint(equalTo: contentGroup.centerXAnchor).isActive = true
        let imageSize = UIScreen.main.bounds.width * 0.9
        nothingToshow.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        nothingToshow.heightAnchor.constraint(equalToConstant: imageSize).isActive = true

        contentGroup.addSubview(newPetButton)
        newPetButton.translatesAutoresizingMaskIntoConstraints = false
        newPetButton.topAnchor.constraint(equalTo: nothingToshow.bottomAnchor).isActive = true
        newPetButton.centerXAnchor.constraint(equalTo: nothingToshow.centerXAnchor).isActive = true
    }

    public func setupPetsCollection() {
        nothingToshow.removeFromSuperview()

        newPetButton.topAnchor.constraint(equalTo: contentGroup.topAnchor,
                                          constant: 40).isActive = true
        newPetButton.rightAnchor.constraint(equalTo: contentGroup.rightAnchor,
                                            constant: -16).isActive = true

        contentGroup.addSubview(petsCollection)
        petsCollection.translatesAutoresizingMaskIntoConstraints = false
        petsCollection.topAnchor.constraint(equalTo: newPetButton.bottomAnchor,
                                            constant: 8).isActive = true
        petsCollection.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor).isActive = true
        petsCollection.trailingAnchor.constraint(equalTo: contentGroup.trailingAnchor).isActive = true
        petsCollection.heightAnchor.constraint(equalToConstant: 155).isActive = true

        contentGroup.addSubview(reminderLabel)
        reminderLabel.translatesAutoresizingMaskIntoConstraints = false
        reminderLabel.topAnchor.constraint(equalTo: petsCollection.bottomAnchor,
                                           constant: 16).isActive = true
        reminderLabel.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor,
                                               constant: 16).isActive = true

        contentGroup.addSubview(noTasks)
        noTasks.translatesAutoresizingMaskIntoConstraints = false
        if UIScreen.main.bounds.width > 400 {
            noTasks.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor, constant: 60).isActive = true
        } else {
            noTasks.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor).isActive = true
        }
        noTasks.centerXAnchor.constraint(equalTo: contentGroup.centerXAnchor).isActive = true
        let size = UIScreen.main.bounds.width * 0.8
        noTasks.widthAnchor.constraint(equalToConstant: size).isActive = true
        noTasks.heightAnchor.constraint(equalToConstant: size - 60).isActive = true

        contentGroup.addSubview(activitiesCollection)
        activitiesCollection.isHidden = true
        activitiesCollection.translatesAutoresizingMaskIntoConstraints = false
        activitiesCollection.topAnchor.constraint(equalTo: reminderLabel.bottomAnchor,
                                                 constant: 16).isActive = true
        activitiesCollection.leadingAnchor.constraint(equalTo: contentGroup.leadingAnchor).isActive = true
        activitiesCollection.trailingAnchor.constraint(equalTo: contentGroup.trailingAnchor).isActive = true
        activitiesCollection.bottomAnchor.constraint(equalTo: contentGroup.bottomAnchor).isActive = true
    }

    public func showActivitiesCollection() {
        noTasks.removeFromSuperview()
        activitiesCollection.isHidden = false
    }
}
