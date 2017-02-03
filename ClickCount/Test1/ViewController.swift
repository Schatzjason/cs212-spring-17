//
//  ViewController.swift
//  Test1
//
//  Created by Jason Schatz on 2/2/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count: Int = 0
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make a label object
        let frame = CGRect(x: 125, y: 120, width: 100, height: 50)
        label = UILabel(frame: frame)
        label!.font = UIFont.systemFont(ofSize: 70)
        label!.text = "0"
        self.view.addSubview(label!)
        
        // Make a button
        let buttonFrame = CGRect(x: 115, y: 220, width: 100, height: 50)
        let button = UIButton(type: .system)
        button.frame = buttonFrame
        button.setTitle("Click", for: .normal)
        self.view.addSubview(button)
        
        // Configure the button with a target/action
        button.addTarget(self, action: #selector(incrementTheCount), for: .touchDown)
    }
    
    func incrementTheCount() {
        count += 1
        label!.text = "\(count)"
    }

}







