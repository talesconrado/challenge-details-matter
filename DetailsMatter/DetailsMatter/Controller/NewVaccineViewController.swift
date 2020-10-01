//
//  NewVaccineViewController.swift
//  DetailsMatter
//
//  Created by Pedro Sousa on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class NewVaccineViewController: UIViewController {

    public weak var delegate: PetDelegate?
    public var owner: PetModel?

    private let repo = DataManager.vaccine

    @IBOutlet weak var vaccineName: UITextField!
    @IBOutlet weak var vaccineDate: UITextField!

    private let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupGesturesRecognizers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupDatePicker()
    }

    private func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.topItem?.title = "Nova Vacina"

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain,
                                                            target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem?.tintColor = .primary
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Salvar", style: .plain,
                                                            target: self, action: #selector(save))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(chooseDate), for: .valueChanged)
        vaccineDate.inputView = datePicker
    }

    private func setupGesturesRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func cancel() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func save() {
        if let vaccineNameString = self.vaccineName.text,
           let vaccineDateString = self.vaccineDate.text,
           let owner = self.owner,
           let item = repo.createNewItem() {
            owner.vaccinesIDs.append(item.identifier)
            item.name = vaccineNameString
            item.date = vaccineDateString
            repo.update(item: item)
            DataManager.pet.update(item: owner)
        }

        if let delegate = self.delegate {
            delegate.reloadVaccineData()
        }

        self.dismiss(animated: true, completion: nil)
    }

    @objc private func tap() {
        view.endEditing(true)
    }

    @objc private func chooseDate(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        vaccineDate.text = formatter.string(from: datePicker.date)
    }
}
