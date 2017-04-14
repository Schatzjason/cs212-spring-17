//
//  ModelStore.swift
//  MovieList
//
//  Created by Jason Schatz on 4/13/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import Foundation

class ModelHelper {
    
    static func moviesFromData(_ data: Data?, keyForArrays: String) -> [Movie] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let JSONDictionary = JSONObject as? [String : Any] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return []
        }
        
        // Print the object, for now, so we can take a look
        prettyPrint(JSONObject: JSONDictionary)
        
        let dictionaries = JSONDictionary[keyForArrays] as! [[String : Any]]
        
        let result: [Movie] = dictionaries.map() {
            Movie(dictionary: $0)!
        }
        
        return result
    }
    
    static func peopleFromData(_ data: Data?, keyForArray: String) -> [Person] {
        
        // No data, return an empty array
        guard let data = data else {
            return []
        }
        
        
        // Parse the Data into a JSON Object
        let JSONObject = try! JSONSerialization.jsonObject(with: data)
        
        // Insist that this object must be a dictionary
        guard let responseDictionary = JSONObject as? [String : Any] else {
            assertionFailure("Failed to parse data. data.length: \(data.count)")
            return [Person]()
        }
        
        // Print the object, for now, so we can take a look
        prettyPrint(responseDictionary)
        
        let personDictionaries = responseDictionary[keyForArray] as! [[String : Any]]
        
        let result = personDictionaries.map() {
            Person(dictionary: $0)!
        }
        
        return result
    }
    
    static private func prettyPrint(_ JSONObject: Any) {
        let prettyData = try! JSONSerialization.data(withJSONObject: JSONObject, options: .prettyPrinted)
        let prettyString = String(data: prettyData, encoding: String.Encoding.utf8)
        print(prettyString ?? "No String Available")
    }
    
}
