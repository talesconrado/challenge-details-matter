//
//  OnboardingCell.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 30/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class OnboardingCell: UICollectionViewCell, UITextViewDelegate {

    var dogLover = false
    var cellOwner: OnboardingView?

    let imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit

        return img
    }()

    let dogImage: UIImageView = {
        let dog = UIImageView()
        dog.translatesAutoresizingMaskIntoConstraints = false
        dog.image = UIImage(named: "dog")
        dog.contentMode = .scaleAspectFit
        dog.isUserInteractionEnabled = true
        dog.alpha = 0.6
        return dog
    }()

    let catImage: UIImageView = {
        let cat = UIImageView()
        cat.translatesAutoresizingMaskIntoConstraints = false
        cat.image = UIImage(named: "cat")
        cat.contentMode = .scaleAspectFit
        cat.isUserInteractionEnabled = true
        cat.alpha = 0.6
        return cat
    }()

    lazy var dogHeight = dogImage.heightAnchor.constraint(equalToConstant: 130)
    lazy var catHeight = catImage.heightAnchor.constraint(equalToConstant: 130)

    lazy var text: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isEditable = false
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 17)
        txt.textColor = .black
        txt.delegate = self

        return txt
    }()

    let button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .primary
        btn.layer.cornerRadius = 12
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(position: Int) {
        switch position {
        case 0:
            setupWelcomeCell()
        case 1:
            setupNotificationsCell()
        case 2:
            setupPetSelectionCell()
        default:
            print("not implemented")
        }
    }

    func setupWelcomeCell() {
        imageView.image = UIImage(named: "welcomecats")
        let firstCellText = "Manter um calendário de rotina do seu pet é muito importante,"
                    + " por isso gostaríamos de te ajudar!\n\nCom PetManager você poderá salvar "
                    + "datas de vacinas, banhos, remédios e o que mais precisar."
        button.setTitle("Continuar", for: .normal)
        text.text = firstCellText
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(text)
        self.contentView.addSubview(button)
        dogHeight.isActive = true

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 72),
            imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),

            text.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            text.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            text.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            text.leftAnchor.constraint(equalTo: leftAnchor, constant: 52),
            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),

            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 72),
            button.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -72),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupNotificationsCell() {
        imageView.image = UIImage(named: "calendar")
        let notificationsText = "Permitir o uso das notificações nos possibilitará te lembrar das suas atividades."
        text.text = notificationsText
        button.setTitle("Ativar Notificações", for: .normal)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(text)
        self.contentView.addSubview(button)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 72),
            imageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25),

            text.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            text.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            text.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            text.leftAnchor.constraint(equalTo: leftAnchor, constant: 52),
            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),

            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 72),
            button.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -72),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupPetSelectionCell() {
        let questionText = "Por último, mas não menos importante:\n\n Você gosta mais de cachorros ou gatos?"
        text.text = questionText
        button.setTitle("Começar", for: .normal)
        self.contentView.addSubview(text)
        self.contentView.addSubview(dogImage)
        self.contentView.addSubview(catImage)
        self.contentView.addSubview(button)

        dogImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapDogImage)))
        catImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCatImage)))
        dogHeight.isActive = true
        catHeight.isActive = true
        button.addTarget(self, action: #selector(setPreference), for: .touchUpInside)

        NSLayoutConstraint.activate([
            text.topAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 72),
            text.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            text.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            text.leftAnchor.constraint(equalTo: leftAnchor, constant: 52),
            text.rightAnchor.constraint(equalTo: rightAnchor, constant: -52),

            dogImage.topAnchor.constraint(lessThanOrEqualTo: text.bottomAnchor, constant: 70),
            dogImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),

            catImage.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 70),
            catImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),

            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -47),
            button.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 72),
            button.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -72),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func setPreference() {
        userPreference()
        _ = (UserDefaults.standard.value(forKey: "DogLover") as? Bool) ?? false
        if dogLover {
            UserDefaults.standard.set(true, forKey: "DogLover")
        } else {
            UserDefaults.standard.set(false, forKey: "DogLover")
        }
    }

    func userPreference() {
        if dogImage.alpha == 1 {
            dogLover = true
        } else {
            dogLover = false
        }
    }

    @objc func tapDogImage() {
        fadeInImage(image: dogImage, duration: 0.3, which: 1)
        fadeOutImage(image: catImage, duration: 0.3)
    }

    @objc func tapCatImage() {
        fadeInImage(image: catImage, duration: 0.3, which: 0)
        fadeOutImage(image: dogImage, duration: 0.3)
    }

    func fadeInImage(image: UIImageView, duration: TimeInterval, which: Int) {
        UIView.animate(withDuration: duration) {
            image.alpha = 1.0
            if which == 1 {
                self.dogHeight.constant = 160
                self.catHeight.constant = 130
            } else {
                self.dogHeight.constant = 130
                self.catHeight.constant = 160
            }

            self.layoutIfNeeded()
        }
    }

    func fadeOutImage(image: UIImageView, duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            image.alpha = 0.6
        }
    }
}
