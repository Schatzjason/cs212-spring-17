//
//  ViewController3.swift
//  TextFieldSkills
//
//  Created by Jason Schatz on 9/20/16.
//  Copyright © 2016 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    let lighteningString = "⚡"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the Button
        let button = UIButton(type: .custom)
        let boltImage = UIImage(named: "lightening-bolt")!
        button.setImage(boltImage, for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        
        // Add Target Method
        button.addTarget(self, action: #selector(addLightening), for: .touchDown)
        
        // Place the button in the right side of the text field
        textField.rightView = button
        textField.rightViewMode = .always
        
        // Register for Keyboard Notifications
        let center = NotificationCenter.default
        
        center.addObserver(self, selector: #selector(keyboardShows), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardHides), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    

    // MARK: -  Repalce Spaces ⚡
    
    @IBAction func addLightening(_ sending: UIButton) {
        let newString = textField.text!.replacingOccurrences(of: " ", with: lighteningString)
        
        textField.resignFirstResponder()
        
        textField.text = newString
    }
    
    
    // MARK: - Keyboard Adjustments
    
    var originalFrame: CGRect!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Let the text field's constraints be re-configured programmatically
        self.textField.translatesAutoresizingMaskIntoConstraints = true
    }
    

    @objc func keyboardShows(_ notification: Notification) {
        
        // Cache the old frame
        originalFrame = self.view.frame
        
        // Calculate the new frame
        let keyboardSize = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size
        let newOrigin = CGPoint(x: originalFrame.origin.x, y: originalFrame.origin.y - keyboardSize.height)
        let insets = CGRect(origin: newOrigin, size: originalFrame.size)
        
        // Set the frame, with animation.
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = insets
        }) 
    }
    
    @objc func keyboardHides(_ notification: Notification) {
        
        if let originalFrame = self.originalFrame {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.frame = originalFrame
            })
        }
    }
    
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
