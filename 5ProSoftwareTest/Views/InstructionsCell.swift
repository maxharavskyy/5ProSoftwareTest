//
//  InstructionsCell.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 08.11.2020.
//

import UIKit


class InstructionsCell: UITableViewCell {
    
    
    let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Go for instructions"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemBlue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        instructionsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        instructionsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
