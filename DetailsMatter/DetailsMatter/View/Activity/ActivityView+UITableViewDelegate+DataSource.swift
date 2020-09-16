//
//  ActivityView+UITableViewDelegate+DataSource.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 16/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

//swiftlint:disable switch_case_alignment

extension ActivityView: UITableViewDelegate {

}

extension ActivityView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)

        switch indexPath.row {
            case 0:
                cell.textLabel?.text = "Categoria"
                cell.detailTextLabel?.text = "Alimentação"
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell.textLabel?.text = "Início"
                cell.detailTextLabel?.text = "9 Sep 2020 10:00"
            case 2:
                cell.textLabel?.text = "Repetir"
                cell.detailTextLabel?.text = "Diariamente"
                cell.accessoryType = .disclosureIndicator
            case 3:
                cell.textLabel?.text = "Parar de repetir"
                cell.detailTextLabel?.text = "Nunca"
                cell.accessoryType = .disclosureIndicator
            default:
                break
        }

        return cell
    }
}
