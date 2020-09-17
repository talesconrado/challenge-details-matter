//
//  RepeatDetails.swift
//  DetailsMatter
//
//  Created by Tales Conrado on 17/09/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

class RepeatDetails: UIView {
    
    lazy var tableView: UITableView = {
        let tbv = UITableView(frame: .zero, style: .grouped)
        tbv.translatesAutoresizingMaskIntoConstraints = false
        tbv.tableFooterView = UIView()
        tbv.delegate = self
        tbv.dataSource = self
        
        return tbv
    }()
    
    let cellNames: [String] = ["Nunca", "Diariamente", "Semanalmente", "Cada 2 semanas", "Mensalmente", "Anualmente"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTableViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error at init of RepeatDetails view.")
    }
    
    func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
}

//MARK: TableView DataSource

extension RepeatDetails: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellId")
        cell.textLabel?.text = cellNames[indexPath.row]
        
        return cell
    }
    
    
}

//MARK: TableView Delegate

extension RepeatDetails: UITableViewDelegate {
    
    
}
