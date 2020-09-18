//
//  CategoryDetailsController.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 18/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//
import UIKit

class CategoryDetailsController: UIViewController {

    var selected: Int?
    weak var delegate: ActivityDetailsDelegate?

    lazy var contentView: DetailsView = {
        let view = DetailsView(size: ActivityValues.categories.count, type: .categoryDetails)
        view.selectedOption = self.selected ?? 0
        view.delegate = self.delegate

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Categorias"
    }

    override func loadView() {
        view = contentView
    }
}
