//
//  Counter.swift
//  ClickCount
//
//  Created by Jason Schatz on 2/3/17.
//  Copyright © 2017 Jason Schatz. All rights reserved.
//

import Foundation

//
// A super simple class that can be used to increment and decrement
// a count. I made this just to stand in the place of a model class
//

class Counter {
    
    private var value: Int
    private let kCount = "count"
    
    init() {
        // get the value using from user defaults
        value = UserDefaults.standard.integer(forKey: kCount)
    }
    
    public func save() {
        // save the value to user defaults
        UserDefaults.standard.set(value, forKey: kCount)
        print("save... count: \(value)")
    }
    
    var count: Int {
        get {
            return value
        }
    }
    
    // Add one
    func increment() {
        value += 1
    }
    
    // Subtract one
    func decrement() {
        value -= 1
    }
}
