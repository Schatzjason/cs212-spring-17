//
//  JSONHelpers.swift
//  MovieList
//
//  Created by Jason Schatz on 5/4/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import Foundation

protocol JSONable {
    
    init?(JSONForm: Any)
    
    var JSONForm: Any {get}
    
}

extension JSONable {
    
    init?(JSONData data: Data) {
        let jsonForm = try! JSONSerialization.jsonObject(with: data)
        
        self.init(JSONForm: jsonForm)
    }
    
    var JSONData: Data {
        return try! JSONSerialization.data(withJSONObject: self.JSONForm)
    }
}

extension Array where Element: JSONable {
    
    var JSONData: Data {
        let jsonArray = self.map() {$0.JSONForm}
        return NSKeyedArchiver.archivedData(withRootObject: jsonArray)
    }
    
    init?(JSONData data: Data) {
        let jsonArray = NSKeyedUnarchiver.unarchiveObject(with: data) as! [Any]
        let jsonableArray = jsonArray.map() { Element(JSONForm: $0)! }
        
        self.init(jsonableArray)
    }
}
