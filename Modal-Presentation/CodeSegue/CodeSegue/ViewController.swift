 //
//  ViewController.swift
//  CodeSegue
//
//  Created by Jason Schatz on 3/2/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 222
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Peach"
    }

    @IBAction func presentUpdatedCount() {
        count += 1
        self.performSegue(withIdentifier: "PresentYellow", sender: self)
    }
    
    @IBAction func presentRedViewController() {
        self.performSegue(withIdentifier: "PresentRed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "PresentYellow" {
            let controller = segue.destination as! YellowViewController
        
            controller.value = count
            controller.message = "Rock"
        }
        
        if segue.identifier == "PresentRed" {
            // do something else
        }
    }
}
