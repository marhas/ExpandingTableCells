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
//    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var expandableStackView: UIStackView!
    @IBOutlet weak var expandableStackViewHeightConstraint: NSLayoutConstraint!

    weak var tableView: UITableView?
    var isExpanded = true

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

//        if !isExpanded {
//            self.tableView?.beginUpdates()
//            self.tableView?.endUpdates()
//        }

        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.allowUserInteraction, .beginFromCurrentState], animations: {
            self.tableView?.beginUpdates()
            self.expandableStackViewHeightConstraint.constant = self.isExpanded ? 150 : 0
            self.layoutIfNeeded()
//            self.secondStackView.isHidden = !self.isExpanded
            self.tableView?.endUpdates()
        }, completion: { completed in
            if !self.isExpanded {
                self.expandableStackView.isHidden = !self.isExpanded
            }
        })

//        if isExpanded {
//            self.tableView?.beginUpdates()
//            self.tableView?.endUpdates()
//        }


//        if isExpanded {
//            nameTextField.becomeFirstResponder()
//        }
    }
}


////        UIView.animate(withDuration: 0.4, animations: {
//self.nameLabel2.isHidden = !self.isExpanded
//self.nameTextField.isHidden = !self.isExpanded
////        }, completion: { finished in
//self.tableView?.beginUpdates()
//self.tableView?.endUpdates()
////        })

