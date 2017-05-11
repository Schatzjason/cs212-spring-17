
import UIKit

class FavoriteListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var movies: [Movie] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        movies = ModelStore.shared.favoriteMovies
        tableView.reloadData()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell")!
        
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
            let url = TMDBURLs.URLForImageWithPath(movie.posterPath!)
            
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
