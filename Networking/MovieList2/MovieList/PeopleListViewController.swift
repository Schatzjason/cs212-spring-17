//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var people: [Person] = [Person]()
    var searchTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUIToDownloading(false)
    }
    
    // MARK: Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // If there is a download in progress, cancel it
        if let task = searchTask {
            task.cancel()
            self.searchTask = nil
        }

        // Empty Search String? Reset to empty table
        if searchText.isEmpty {
            setUIToDownloading(false)
            self.people = []
            self.tableView.reloadData()
        }
        
        // Start the downloading UI
        setUIToDownloading(true)
        
        // Get URL
        let parameters = ["query" : searchText]
        let url = TMDBURLs.URLForResource(resource: TMDB.Resources.SearchPerson, parameters: parameters)

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            // Simple error handling
            if let error = error {
                print(error)
                return
            }
            
            // Update the view controller's state
            self.people = ModelHelper.peopleFromData(data, keyForArray: TMDB.Keys.Results)
            
            // Send the UI Updating work back to the main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.setUIToDownloading(false)
            }
        }
        
        task.resume()
    }
    
    // MARK: - Toggle UI while downloading
    
    func setUIToDownloading(_ isDownloading: Bool) {
        
        if isDownloading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.isHidden = isDownloading
        self.tableView.alpha = isDownloading ? 0.2 : 1.0
    }
    
    
    // MARK: - Table Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    var cellNumber = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        // Get the movie associated with this row out of the array
        let person = people[indexPath.row]
        
        // Set the movie title
        cell.textLabel!.text = person.name
        
        // Set the movie poster
        
        if person.imagePath == nil {
            // api node has no imagepath
            cell.imageView!.image = UIImage(named: "noImage")
        } else {
            // Set a placeholder before we start the download
            cell.imageView!.image = UIImage(named: "placeHolder")
        
            // get url, 
            let url = TMDBURLs.URLForPosterWithPath(person.imagePath!)

            // create task
            let task = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in

                if let error = error {
                    print(error)
                }

                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imageView!.image = image
                    }
                }
            }) 
            
            // resume task
            task.resume()
        }
        
        return cell
    }
    
    
    // MARK: - Table Delegate for Segueing
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowCast", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MovieListViewController
        let person = people[tableView.indexPathForSelectedRow!.row]
        
        controller.person = person
    }
    
}
