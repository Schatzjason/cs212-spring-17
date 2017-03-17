//
//  ViewController.swift
//  Simple Navigation
//
//  Created by Jason Schatz on 3/9/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var rightButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Root"

        self.rightButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchForSomething))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.setRightBarButton(self.rightButton, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.navigationItem.setRightBarButton(nil, animated: false)
    }

    @IBAction func doTheNavigation() {
        performSegue(withIdentifier: "NavigateToYellow", sender: self)
    }
    
    func searchForSomething() {
        print("search...")
    }
}

