//
//  ViewController.swift
//  TwoViewControllers
//
//  Created by ccsfcomputers on 9/27/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import UIKit

private enum SegueIdentifier: String {
    case PresentBlue, PresentRed
}

class OrangeViewController: UIViewController {

    let PresentBlue = "PresentBlue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem(title: "Go Orange", style: .plain, target: nil, action:nil)

        self.navigationItem.title = "Orange!"
        
        self.navigationItem.backBarButtonItem = backButton
    }
    
    func backWasPressed() {
        print("back was pressed")
    }
    
    @IBAction func showBlue(_ sender: UIButton) {
        let c = self.storyboard!.instantiateViewController(withIdentifier: "BlueViewController")
        
        self.navigationController!.pushViewController(c, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let segueID = SegueIdentifier(rawValue: segue.identifier!)!
        
        switch segueID {
        case .PresentBlue:
            let blueVC = segue.destination as! BlueViewController
            blueVC.number = 55
        case .PresentRed:
            print("Present red...")
        }
    }
}

