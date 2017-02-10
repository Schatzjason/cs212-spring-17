//
//  ViewController.swift
//  TwoButtonsOneAction
//
//  Created by Jason Schatz on 2/9/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!

    @IBAction func digitPressed(sender: UIButton) {

        var digit = 0
        
        switch (sender) {
        case oneButton:
            digit = 1
        case twoButton:
            digit = 2
        default:
            assert(false)
        }
        
        textField.text = "\(digit)"
    }
}

