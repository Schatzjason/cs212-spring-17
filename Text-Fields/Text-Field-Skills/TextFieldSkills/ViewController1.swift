//
//  ViewController.swift
//  TextFieldSkills
//
//  Created by Jason Schatz on 9/20/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    let bolt = "⚡"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the Button
        let button = UIButton(type: .custom)
        let boltImage = UIImage(named: "lightening-bolt")!
        button.setImage(boltImage, for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        
        // Add Target Method
        button.addTarget(self, action: #selector(addLightning), for: .touchDown)
        
        // Place the button in the right side of the text field
        textField.rightView = button
        textField.rightViewMode = .whileEditing
    }
    
    
    // MARK: -  Repalce Spaces ⚡
    
    func addLightning(_ sending: UIButton) {
        
        let newText = textField.text?.replacingOccurrences(of: " ", with: bolt)
        textField.text = newText

    }
}

