//
//  ModelStore.swift
//  MovieList
//
//  Created by Jason Schatz on 4/13/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import Foundation

class ModelStore {
    
    static let shared = ModelStore()

    private static let _favoriteMoviesFileName = "favoriteMovies.JSON"
    
    private var _favoriteMovies: [Movie] = []
    
    init() {
        _favoriteMovies = readFavoritesFromFile()
    }
    
    func addToFavorites(movie: Movie) {
        _favoriteMovies.append(movie)
        write_favoriteMoviesToFile()
    }
    
    func removeFromFavorites(movie: Movie) {
        _favoriteMovies = _favoriteMovies.filter() {$0.id != movie.id}
        write_favoriteMoviesToFile()
    }
    
    func isFavorite(movie: Movie) -> Bool {
        return !_favoriteMovies.filter({$0.id == movie.id}).isEmpty
    }
    
    func toggleFavoriteStatus(movie: Movie) {
        if isFavorite(movie: movie) {
            removeFromFavorites(movie: movie)
        } else {
            addToFavorites(movie: movie)
        }
    }
    
    var favoriteMovies: [Movie] {
        return _favoriteMovies
    }
    
    private func readFavoritesFromFile() -> [Movie] {
        
        var result: [Movie]
        
        if FileManager.default.fileExists(atPath: _favoriteMoviesFileURL.path) {
            let data = try! Data(contentsOf: _favoriteMoviesFileURL)
            
            result = Array<Movie>(JSONData: data)!
        } else {
            result = []
        }
        
        return result
        
    }
    
    private func write_favoriteMoviesToFile() {
        print("data: \(_favoriteMovies.JSONData)")
        print("url: \(_favoriteMoviesFileURL)")
        try! _favoriteMovies.JSONData.write(to: _favoriteMoviesFileURL)
    }
    
    private lazy var _favoriteMoviesFileURL: URL = {
        let docs = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let docsURL = URL(fileURLWithPath: docs)
        
        return docsURL.appendingPathComponent(_favoriteMoviesFileName)
    }()
     
}
