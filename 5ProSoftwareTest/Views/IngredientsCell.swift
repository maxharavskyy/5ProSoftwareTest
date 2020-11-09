//
//  IngredientsCell.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 08.11.2020.
//

import UIKit

class IngredientsCell: UITableViewCell {
    

    let ingredientLabel = UILabel()
    
    weak var viewModel: IngredientCellViewModelProtocol? {
         willSet(viewModel) {
             guard let viewModel = viewModel else {return}
            ingredientLabel.text = viewModel.ingredient
         }
     }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(ingredientLabel)
        ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ingredientLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ingredientLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        ingredientLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
