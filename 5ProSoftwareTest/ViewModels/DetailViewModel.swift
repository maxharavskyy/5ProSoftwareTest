//
//  DetailViewModel.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol {
    
    var recipe: Recipe {get}
    var ingredients: [String] {get}
    
    func numberOfRows() -> Int
    func fetchDetails(completion: @escaping() -> ())
    func populateIngredients(at indexPath: IndexPath) -> IngredientCellViewModelProtocol?
    func setTitle() -> String
    func openInstructions(comletion: @escaping(URL) -> ())
    func setHeaderImage(completion: @escaping(UIImage?) -> ())
    func setHeaderImage() -> UIImage
    
}


class DetailViewModel: DetailViewModelProtocol {
   
    
    

    var recipe: Recipe
    
    var ingredients = [String]()
    
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    
    func numberOfRows() -> Int {
        guard let ingredients = recipe.ingredients else {return 0}
        return ingredients.count
    }
    
    func populateIngredients(at indexPath: IndexPath) -> IngredientCellViewModelProtocol? {
        let ingredient = ingredients[indexPath.row]
        return IngredientCellViewModel(ingredient: ingredient)
    }
    
    func setTitle() -> String {
        return recipe.title
    }
    
    func fetchDetails(completion: @escaping () -> ()) {
        guard let id = recipe.recipe_id else {return}
        let urlString = "https://recipesapi.herokuapp.com/api/get?rId=\(id)"
        
        Service.detailRequest(url: urlString) { (result, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            
            guard let result = result else {return}
            self.recipe = result.recipe
            self.ingredients = result.recipe.ingredients ?? []
            completion()
        }
    }
    
    func openInstructions(comletion: @escaping(URL) -> ()) {
        guard let url = URL(string: recipe.source_url) else {return}
        comletion(url)
    }
    
    let dataProvider = DataProvider()
    
    func setHeaderImage(completion: @escaping(UIImage?) -> ()) {
        guard let url = URL(string: recipe.image_url) else {return}
        dataProvider.downloadImage(url: url) { (image) in
            completion(image)
        }
    }
    
    
    func setHeaderImage() -> UIImage {
        var imageV = UIImage()
        guard let url = URL(string: recipe.image_url) else {return UIImage()}
        dataProvider.downloadImage(url: url) { (image) in
            imageV = image!
        }
        return imageV
    }
    
}
