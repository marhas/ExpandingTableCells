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
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var expandableStackView: UIStackView!
    @IBOutlet var expandableStackViewHeightConstraint: NSLayoutConstraint!

    weak var tableView: UITableView?
    var isExpanded = false

    init() {
        super.init(style: .default, reuseIdentifier: ExpandingCheckboxStackViewCell.reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        selectionStyle = .none
        contentView.backgroundColor = .green
    }

    @IBAction func acceptButtonPressed(_ sender: Any) {
        isExpanded = !isExpanded
        if isExpanded {
            self.expandableStackView.isHidden = false
        }

        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.tableView?.beginUpdates()
            self.expandableStackViewHeightConstraint.isActive = !self.isExpanded
            self.layoutIfNeeded()
            self.tableView?.endUpdates()
        }, completion: { completed in
            if !self.isExpanded {
                self.expandableStackView.isHidden = !self.isExpanded
            }
        })
        if isExpanded {
            nameTextField.becomeFirstResponder()
        }
    }
}
