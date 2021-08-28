//
//  DataStorage.swift
//  Concentration Game
//
//  Created by Muhammad Azeem on 28/11/2020.
//

import Foundation

class DataStorage {
    let defaults = UserDefaults.standard
    var scores: [String] = []
    
    func save(score: [String], key: String) {
        
        defaults.set(score, forKey: key)
        
    }
    
    func load(key: String) -> [String]{
        if let arr = defaults.array(forKey: key) as? [String] {
            scores = arr
        }
//        print(scores)
//        print("Data Loaded")
        return scores
    }
}
