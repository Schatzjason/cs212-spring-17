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
    
    // The private property we will use to 
    // hold the value that is being incremented
    private var value: Int = 0
    
    // A read-only count property
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
