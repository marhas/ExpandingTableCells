//
//  ViewController.swift
//  TableViewCells
//
//  Created by Marcel Hasselaar on 2017-12-20.
//  Copyright © 2017 Marcel Hasselaar. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ExpandingCheckboxStackViewCell", bundle: nil), forCellReuseIdentifier: ExpandingCheckboxStackViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: "ExpandingCheckboxCell", bundle: nil), forCellReuseIdentifier: ExpandingCheckboxCell.reuseIdentifier)

        tableView.estimatedRowHeight = UITableViewAutomaticDimension
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingCheckboxCell.reuseIdentifier, for: indexPath) as! ExpandingCheckboxCell
            cell.acceptButton.setTitle("Accept \(indexPath.row)", for: .normal)
            cell.indexPath = indexPath
            cell.selfSizingCellDelegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpandingCheckboxStackViewCell.reuseIdentifier, for: indexPath) as! ExpandingCheckboxStackViewCell
            cell.acceptButton.setTitle("Accept \(indexPath.row)", for: .normal)
            cell.tableView = tableView
            return cell
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension MyTableViewController: SelfSizingCellDelegate {
    func cellNeedsResize(at indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
