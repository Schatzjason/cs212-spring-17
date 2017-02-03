//
//  BlueViewController.swift
//  TwoViewControllers
//
//  Created by ccsfcomputers on 9/27/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

enum RPS {
    case rock, paper, scissors  
}

class BlueViewController: UIViewController {
    
    var number: Int!
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationItem.title = "Blue!"
    }
    
    @IBAction func dismissMyself(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        //label.text = "\(number ?? -1)"
    }
}
