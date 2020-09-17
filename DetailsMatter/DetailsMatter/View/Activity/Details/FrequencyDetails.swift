//
//  RepeatDetails.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class RepeatDetails: UIView {

    let tableView: UITableView = {
        let tbv = UITableView()
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.tableFooterView = UIView()

        return tbv
    }()

}
