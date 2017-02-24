//
//  SimpleDelegate.swift
//  SimpleTextViewDelegate
//
//  Created by Jason Schatz on 2/23/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import UIKit

class SimpleDelegate: NSObject, UITextFieldDelegate {
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did begin editing")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string)
        
        if newText.contains(" ") {
            textField.text = "No-Spaces!"
        } else {
            textField.text = newText
        }
        
        return false
    }
}
