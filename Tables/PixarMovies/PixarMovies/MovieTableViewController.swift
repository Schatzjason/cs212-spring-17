//
//  MovieTableViewController.swift
//  PixarMovies
//
//  Created by Jason Schatz on 3/16/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    let movies = Model().movies

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pixar Movies"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.dateLabel.text = "\(movie.year)"
        cell.poster.image = UIImage(named: movie.posterName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowMovieDetail", sender: self)
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MovieDetailViewController
        let row = tableView.indexPathForSelectedRow!.row
        let movie = movies[row]
        
        controller.movie = movie
    }
}
