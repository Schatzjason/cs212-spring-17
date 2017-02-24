//
//  ViewController.swift
//  SimpleTextViewDelegate
//
//  Created by Jason Schatz on 2/23/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    var simpleDelegate: UITextFieldDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = SimpleDelegate()
        
        self.simpleDelegate = d
        self.textField.delegate = d
    }
}

