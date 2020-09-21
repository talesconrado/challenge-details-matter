//
//  StopRepeatDetailsController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 21/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class StopRepeatDetailsController: UIViewController {

    var selected: Int?
    var date: Date?
    weak var delegate: ActivityDetailsDelegate?

    lazy var contentView: StopRepeatDetails = {
        let view = StopRepeatDetails(size: ActivityValues.stopRepeat.count, type: .stopRepeatDetails)
        view.selectedOption = self.selected ?? 0
        view.stopRepeatDate = date
        view.delegate = self.delegate

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Parar de repetir"
    }

    override func loadView() {
        view = contentView
    }
}
