//
//  RobotStore.swift
//  FinalExamReview
//
//  Created by DJ Holt on 12/5/22.
//

import UIKit

class RobotStore {
    
    var robots = [Robot]()
    
    let robotArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("robots.json")
    }()
    
    init() {
        robots.append(Robot(name: "R2D2", color: "White/Blue", cost: 1000000))
        robots.append(Robot(name: "C3P0", color: "Shiny Gold", cost: 1500000))
        robots.append(Robot(name: "BB-8", color: "White/Orange", cost: 1750000))

        do {
            let data = try Data(contentsOf: robotArchiveURL)
            let unarchiver = JSONDecoder()
            robots = try unarchiver.decode([Robot].self, from: data)
        } catch {
            print("Error reading in saved robots: \(error)")
        }

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(saveChanges), name: UIScene.didEnterBackgroundNotification, object: nil)
    }
    
    @objc func saveChanges() -> Bool {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(robots)
            try data.write(to: robotArchiveURL, options: [.atomic])
            print("Saved all of the robots to: \(robotArchiveURL)")
            return true
        } catch let encodingError {
            print("Error encoding robots: \(encodingError)")
            return false
        }
    }
}
