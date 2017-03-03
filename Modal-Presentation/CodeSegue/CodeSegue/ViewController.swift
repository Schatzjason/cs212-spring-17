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

    @IBAction func presentModaly(_ sender: Any) {
        
        let contoller = self.storyboard!.instantiateViewController(withIdentifier: "YellowViewController")
        let yellowVC = contoller as! YellowViewController
        
        count += 1
        
        yellowVC.value = count
        yellowVC.message = "Bam!!"
        
        present(yellowVC, animated: true, completion: nil)
        
    }
}

