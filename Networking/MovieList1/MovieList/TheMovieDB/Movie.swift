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
    
    init?(dictionary: [String : AnyObject]) {
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



