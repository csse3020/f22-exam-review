//
//  Robot.swift
//  FinalExamReview
//
//  Created by DJ Holt on 12/5/22.
//

import Foundation

class Robot: Codable {
    
    var name: String
    var color: String
    var cost: Int
    
    init(name: String, color: String, cost: Int) {
        self.name = name
        self.color = color
        self.cost = cost
    }
}
