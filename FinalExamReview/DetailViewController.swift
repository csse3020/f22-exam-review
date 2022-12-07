//
//  DetailViewController.swift
//  FinalExamReview
//
//  Created by DJ Holt on 12/7/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    var robot: Robot!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = robot.name
        
        navigationItem.title = robot.name
    }
    
}
