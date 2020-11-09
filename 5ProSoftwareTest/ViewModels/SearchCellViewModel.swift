//
//  SearchCellViewModel.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import Foundation


protocol SearchCellViewModelProtocol: class {
    var title: String {get}
    var image_url: String {get}
}



class SearchCellViewModel: SearchCellViewModelProtocol {
    
    private var recipe: Recipe
    
    
    var title: String {
        return recipe.title
    }
    
    var image_url: String {
        return recipe.image_url
    }
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
}
