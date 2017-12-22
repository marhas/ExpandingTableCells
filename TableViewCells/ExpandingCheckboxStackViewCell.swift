//
//  ExpandingCheckboxStackViewCell.swift
//  TableViewCells
//
//  Created by Marcel Hasselaar on 2017-12-20.
//  Copyright © 2017 Marcel Hasselaar. All rights reserved.
//

import UIKit

class ExpandingCheckboxStackViewCell: UITableViewCell {

    public static let reuseIdentifier = "ExpandingCheckboxStackViewCell"
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    weak var tableView: UITableView?
    var isExpanded = true

    init() {
        super.init(style: .default, reuseIdentifier: ExpandingCheckboxStackViewCell.reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        selectionStyle = .none
    }

    @IBAction func acceptButtonPressed(_ sender: Any) {
        isExpanded = !isExpanded
//        UIView.animate(withDuration: 0.4, animations: {
            self.nameLabel2.isHidden = !self.isExpanded
            self.nameTextField.isHidden = !self.isExpanded
//        }, completion: { finished in
            self.tableView?.beginUpdates()
            self.tableView?.endUpdates()
//        })
        if isExpanded {
            nameTextField.becomeFirstResponder()
        }
    }
}
