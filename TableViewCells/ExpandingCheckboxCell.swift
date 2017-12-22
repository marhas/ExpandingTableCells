//
//  ExpandingCheckboxStackViewCell.swift
//  TableViewCells
//
//  Created by Marcel Hasselaar on 2017-12-20.
//  Copyright © 2017 Marcel Hasselaar. All rights reserved.
//

import UIKit

protocol SelfSizingCellDelegate: class {
    func cellNeedsResize(at indexPath: IndexPath)
}

class ExpandingCheckboxCell: UITableViewCell {

    public static let reuseIdentifier = "ExpandingCheckboxCell"
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet var contractedHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var expandableView: UIView!
    public weak var selfSizingCellDelegate: SelfSizingCellDelegate?
    public var indexPath: IndexPath?
    private var contractionConstraint: NSLayoutConstraint!
//    weak var tableView: UITableView?
    var isContracted = true {
        didSet {
            animateSizeChange(isContracted: isContracted)
        }
    }

    init() {
        super.init(style: .default, reuseIdentifier: ExpandingCheckboxCell.reuseIdentifier)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        selectionStyle = .none
    }

    override func didMoveToSuperview() {
        contractionConstraint = expandableView.bottomAnchor.constraint(equalTo: nameLabel1.bottomAnchor)
    }

    override func prepareForReuse() {
        print("Prepare for reuse!")
    }

    private func animateSizeChange(isContracted: Bool) {
        print("Toggling state. isContracted = \(isContracted)")
        guard let indexPath = indexPath else { return }

        if isContracted {
//            contractedHeightConstraint.constant = expandableView.bounds.height
//            self.contractedHeightConstraint.isActive = true
//            layoutIfNeeded()
//            contractedHeightConstraint.constant = 0
            contractionConstraint.isActive = true
        } else {
            contractionConstraint.isActive = false
//            self.contractedHeightConstraint.isActive = false
        }


        UIView.animate(withDuration: 1, animations: {
            self.layoutIfNeeded()
        }) { animationFinished in
//            if !isContracted {
                self.selfSizingCellDelegate?.cellNeedsResize(at: indexPath)
                print("Animation finished: \(animationFinished)")
//            }
        }
    }

    @IBAction func acceptButtonPressed(_ sender: Any) {
        print("before. isContracted = \(isContracted)")
        isContracted = !isContracted
        print("after. isContracted = \(isContracted)")
//        UIView.animate(withDuration: 0.4, animations: {
//            self.expandableViewHeightConstraint.isActive = !self.isExpanded
//        }, completion: { finished in
//            self.tableView?.beginUpdates()
//            self.tableView?.endUpdates()
//        })
//        if isExpanded {
//            nameTextField.becomeFirstResponder()
//        }
    }
}
