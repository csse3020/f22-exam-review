//
//  ViewController.swift
//  FinalExamReview
//
//  Created by DJ Holt on 12/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var robotStore: RobotStore! = RobotStore()
    @IBOutlet var tableView: UITableView!
    
//    var robots = ["R2D2", "C3PO", "WALL-E", "Iron Giant", "Sonny"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robotStore.robots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RobotCell", for: indexPath) as! RobotCell
        
        let robot = robotStore.robots[indexPath.row]
        cell.nameLabel.text = robot.name
        cell.colorLabel.text = robot.color
        cell.costLabel.text = "\(robot.cost)"
        
        return cell
    }

    @IBAction func addNewRobot(_ sender: UIBarButtonItem) {
        robotStore.robots.append(Robot(name: "Sonny", color: "Silvery", cost: 123235234))
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            // typecast the destination controller
            let detailController = segue.destination as! DetailViewController
            // what data are we passing? the robot that was selected.
            if let indexPath = tableView.indexPathForSelectedRow {
                // assign a data member into the destination controller
                detailController.robot = robotStore.robots[indexPath.row]
            }
        }
    }
}
