//
//  Service.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import Foundation
import UIKit


class Service {
    
    static func dataRequest(url: URL, completion: @escaping(RecipeResults?, Error?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print("error fetching:", error)
                return
            }
            
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode(RecipeResults.self, from: data)
                completion(result, nil)
                
                
            } catch {
                print("failure decode:" , error)
                completion(nil, error)
            }
            
        }.resume()
        
    }
    
    
    static func detailRequest(url: String, completion: @escaping(RecipeDetail?, Error?) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
            if let error = error {
                print("error fetching:", error)
                return
            }
            
            guard let data = data else {return}
            do {
                let result = try JSONDecoder().decode(RecipeDetail.self, from: data)
                completion(result, nil)
                
                
            } catch {
                print("failure decode:" , error)
                completion(nil, error)
            }
            
        }.resume()
        
    }
       
    
}
