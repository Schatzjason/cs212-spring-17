//
//  YellowViewController.swift
//  CodeSegue
//
//  Created by Jason Schatz on 3/2/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {
    
    var value: Int = 0
    var message: String!
    
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Yellow"
    }
    
    @IBAction func dismiss() {
        self.navigationController!.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.messageLabel.text = message
        self.valueLabel.text = "\(value)"
    }
}
