//
//  ViewController.swift
//  Switch-And-TextField
//
//  Created by Jason Schatz on 3/2/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    private var editable = true

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var theSwitch: UISwitch!

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return editable
    }
    
    @IBAction func flipTextFieldEditing(sender: UISwitch) {
        textField.isEnabled = theSwitch.isOn
        //editable = theSwitch.isOn
    }
}

