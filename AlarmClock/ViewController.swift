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
    
    var alarm = Alarm()
    var setTime: Date!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if setTime == nil {
            alarm.selectedWakeUpTime = dateFromString(string: "6:00", format: "HH:mm")
        }else{
            alarm.selectedWakeUpTime = setTime
            timeLabel.text = stringFromDate(date: setTime, format: "HH:mm")
        }
    }

    @IBAction func toSetting() {
        performSegue(withIdentifier: "setting", sender: nil)
    }
    
    @IBAction func sleep() {
        alarm.runTimer()
        performSegue(withIdentifier: "awake", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setting" {
            let nextVC = segue.destination as! SettingViewController
            nextVC.alarm = alarm
        }
        
        if segue.identifier == "awake" {
            let nextVC = segue.destination as! AwakeViewController
            nextVC.alarm = alarm
        }
    }
    
    func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

}

