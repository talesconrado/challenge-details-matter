//
//  RepeatDetailsController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class RepeatDetailsController: UIViewController {

    var selected: Int?
    weak var delegate: ActivityDetailsDelegate?

    lazy var contentView: DetailsView = {
        let view = DetailsView(size: ActivityValues.repeatOptions.count, type: .repeatDetails)
        view.selectedOption = self.selected ?? 0
        view.delegate = self.delegate

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Repetir"
    }

    override func loadView() {
        view = contentView
    }
}
