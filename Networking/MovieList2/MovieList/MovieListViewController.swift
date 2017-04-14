//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {
    
    var movies: [Movie] = [Movie]()
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Put the actor's name in the navigation bar??
        self.navigationItem.title = person.name

//        ModelStore.moviesForPersonID(person.id) { movies in
//            self.movies = movies
//            self.tableView.reloadData()
//        }
        
        // URL
        let p = [TMDB.Keys.ID : person.id]
        let url = TMDBURLs.URLForResource(resource: TMDB.Resources.PersonIDMovieCredits, parameters: p)
        
        // Task
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let error = error {print(error); return}
            
            let cast = ModelHelper.moviesFromData(data, keyForArrays: "cast")
            
            self.movies = cast
            
            // reload the table
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        task.resume()
    }
    
    // MARK: - Table View
    override
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    var cellNumber = 0
    
    override
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        // Get the movie associated with this row out of the array
        let movie = movies[indexPath.row]
        
        // Set the movie title
        cell.textLabel!.text = movie.title
        
        // Set the movie poster
        
        if movie.posterPath == nil {
            // api node has no imagepath
            cell.imageView!.image = UIImage(named: "noImage")
        } else {
            // Set a placeholder before we start the download
            cell.imageView!.image = UIImage(named: "placeHolder")
            
            // get url,
            let url = TMDBURLs.URLForPosterWithPath(movie.posterPath!)
            
            // create task
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in

                if let error = error {print(error); return}
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                }
            })
            
            // resume task
            task.resume()
        }
        
        return cell
    }
}
