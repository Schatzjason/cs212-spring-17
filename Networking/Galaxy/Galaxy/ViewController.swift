

import UIKit

class GalaxyViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var isDownloading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toggleViews(isDownloading: false)
    }
    
    @IBAction func downloadOrCancel() {

        isDownloading = !isDownloading
        
        if isDownloading {
            beginDownloading()
        }
        
        toggleViews(isDownloading: isDownloading)
    }
    
    func beginDownloading() {
    }
        
    func toggleViews(isDownloading: Bool) {
    
        // Button
        let buttonTitle = isDownloading ? "Cancel" : "Start"
        button.setTitle(buttonTitle, for: .normal)
        
        // Activity Indicator
        if isDownloading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        
        // Image View
        imageView.isHidden = isDownloading
    }
}
