//: Playground - noun: a place where people can play

import UIKit

let values = [2, 444, 6, 8, 9, 10, 11]
let strings = ["ABC", "hello", "1000", "One day", "1234"]

func isShort(value: String) -> Bool {
    return value.characters.count < 4
}


let sum = values.reduce(0) { (accumulator: Int, element: Int) in
    return max(accumulator,  element)
}

