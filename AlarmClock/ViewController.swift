//
//  ViewController.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/04.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var alarmListVC = AlarmListViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.text = alarmListVC.timeArray[0]
        
        // Do any additional setup after loading the view.
    }

    @IBAction func toList() {
        performSegue(withIdentifier: "toList", sender: nil)
    }
    
    @IBAction func sleep() {
        
    }

}

