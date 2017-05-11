//
//  Movie.swift
//  TheMovieDB
//
//  Created by Jason on 1/11/15.
//

import UIKit

struct Movie {
    
    struct Keys {
        static let Title = "title"
        static let PosterPath = "poster_path"
        static let ID = "id"
    }
    
    var title: String
    var id: Int
    var posterPath: String? = nil
    var posterImage: UIImage?
    
    init?(dictionary: [String : Any]) {
        // Mandatory values
        guard
            let title = dictionary[Keys.Title] as? String,
            let id = dictionary[Keys.ID] as? Int
        else {
            return nil
        }
        
        // Optional value
        let posterPath = dictionary[Keys.PosterPath] as? String
        
        // Pass them to the full initializer
        self.init(title: title, id: id, posterPath: posterPath)
    }
    
    init(title: String, id: Int, posterPath: String?) {
        self.title = title
        self.id = id
        self.posterPath = posterPath
    }
}

extension Movie : JSONable {
    
    var JSONForm: Any {
        var d = [String : Any]()
        
        d[Keys.Title] = self.title
        d[Keys.ID] = self.id
        
        if let path = self.posterPath {
            d[Keys.PosterPath] = path
        }
        
        return d
    }
    
    init?(JSONForm: Any) {
        let d = JSONForm as! [String : Any]
        self.init(dictionary: d)
    }
}



