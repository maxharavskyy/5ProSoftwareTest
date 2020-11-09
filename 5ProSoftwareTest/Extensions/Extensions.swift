//
//  Extensions.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 08.11.2020.
//

import UIKit


extension UITableView {

    func setEmptyMessage() {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = "Please provide some search..."
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.sizeToFit()
        messageLabel.textColor =
          UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return .white
            default:
                return .black
            }
          }

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
