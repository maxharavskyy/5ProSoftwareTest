//
//  Recipe.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import Foundation


struct RecipeResults: Decodable {
    
    let count: Int
    let recipes: [Recipe]
  
}

struct Recipe: Decodable  {
    
    let title: String
    let image_url: String
    let ingredients: [String]?
    let recipe_id: String?
    let source_url: String
    
}

struct RecipeDetail: Decodable {
    
    let recipe: Recipe
    
}
