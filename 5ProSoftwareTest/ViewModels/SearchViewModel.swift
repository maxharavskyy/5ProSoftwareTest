//
//  SearchViewModel.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import Foundation


protocol SearchViewModelProtocol {
    
    func numberOfRows() -> Int
    func toCellViewModel(at indexPath: IndexPath) -> SearchCellViewModelProtocol?
    func viewModelForSelectedRow() -> DetailViewModel?
    func selectRow(at indexPath: IndexPath)
    func search(term: String, completion: @escaping() -> ())
}


class SearchViewModel: SearchViewModelProtocol {
    
    var recipes = [Recipe]()
    
    var selectedIndexPath: IndexPath?
    
    
    func numberOfRows() -> Int {
        return recipes.count
    }
    
   
    func toCellViewModel(at indexPath: IndexPath) -> SearchCellViewModelProtocol? {
        let recipe = recipes[indexPath.row]
        return SearchCellViewModel(recipe: recipe)
    }
    
    
    func viewModelForSelectedRow() -> DetailViewModel? {
        guard let indexPath = selectedIndexPath else {return nil}
        return DetailViewModel(recipe: recipes[indexPath.row])
    }
    
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func clear() {
        self.recipes.removeAll()
    }
    
    
    var timer: Timer?
    
    func search(term: String, completion: @escaping () -> ()) {
        var urlString = URLComponents(string: "https://recipesapi.herokuapp.com/api/search")!
        
        urlString.queryItems = [URLQueryItem(name: "q", value: term)]
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (_) in
            guard let url = urlString.url else {return}
            
            Service.dataRequest(url: url) { [weak self] (res, err) in
                if let err = err {
                    print(err.localizedDescription)
                    return
                }
                
                self?.recipes = res?.recipes ?? []
                completion()
            }
        })
        
    }
    

    
    
   
    
    
}
