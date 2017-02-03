//
//  RPSMove.swift
//  TwoViewControllers
//
//  Created by ccsfcomputers on 10/4/16.
//  Copyright © 2016 ccsfcomputers. All rights reserved.
//

import Foundation

enum RPSMove: Int {
    case rock = 0, paper = 1, scissors = 2
}

extension RPSMove {
    func random() -> RPSMove {
        let randomValue = Int(arc4random()) % 3
        return RPSMove(rawValue: randomValue)!
    }
    
    var stringValue: String {
            switch self {
            case .rock:
                return "Rock"
            case .paper:
                return "Paper"
            case .scissors:
                return "Scissors"
            }
    }

    init?(string: String) {
        switch string {
        case "Rock":
            self = .rock
        default:
            return nil
        }
    }
}

