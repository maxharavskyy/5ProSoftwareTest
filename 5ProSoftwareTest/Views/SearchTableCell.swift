//
//  SearchTableCell.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import UIKit

  
class SearchTableCell: UITableViewCell {
    
   var dataProvider = DataProvider()
    
   weak var viewModel: SearchCellViewModelProtocol? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            titleLabel.text = viewModel.title
            guard let url = URL(string: viewModel.image_url) else {return}
            dataProvider.downloadImage(url: url) { (image) in
                self.recipeImage.image = image
            }
            
        }
    }
    
    let titleLabel = UILabel()
    let recipeImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = .systemFont(ofSize: 15)
        titleLabel.numberOfLines = 2
        recipeImage.clipsToBounds = true
       
        addSubview(titleLabel)
        addSubview(recipeImage)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            recipeImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            recipeImage.widthAnchor.constraint(equalToConstant: frame.width / 4),
            
           
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
