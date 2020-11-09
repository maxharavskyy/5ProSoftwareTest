//
//  IngredientCellViewModel.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 08.11.2020.
//

import Foundation


protocol IngredientCellViewModelProtocol: class {
    var ingredient: String {get}
   
}

class IngredientCellViewModel: IngredientCellViewModelProtocol {
    
    var ingredient: String
    
    init(ingredient: String) {
        self.ingredient = ingredient
    }
    
}
