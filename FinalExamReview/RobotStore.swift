//
//  RobotStore.swift
//  FinalExamReview
//
//  Created by DJ Holt on 12/5/22.
//

import Foundation

class RobotStore {
    
    var robots = [Robot]()
    
    init() {
        robots.append(Robot(name: "R2D2", color: "White/Blue", cost: 1000000))
        robots.append(Robot(name: "C3P0", color: "Shiny Gold", cost: 1500000))
        robots.append(Robot(name: "BB-8", color: "White/Orange", cost: 1750000))
    }
    
}
