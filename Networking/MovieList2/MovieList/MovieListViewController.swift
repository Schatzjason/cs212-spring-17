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
        
        // Get the credits for this person??
        print("In Movie List. Person: \(person.name)")
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
                
                // How do we load the table view cell image here??
            })
            
            // resume task
            task.resume()
        }
        
        return cell
    }
}
