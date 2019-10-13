//
//  AwakeViewController.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/13.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class AwakeViewController: UIViewController {
    
    var alarm = Alarm()
    var listVC = AlarmListViewController()
    var currentTime = CurrentTime()
    
    @IBOutlet var currentTimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentTime.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stop() {
        if alarm.sleepTimer == nil {
            alarm.stopTimer()
            listVC.table.allowsSelection = true
            dismiss(animated: true, completion: nil)
        }else{
            dismiss(animated: true, completion: nil)
        }
    }
    
    func updateTime(_ time:String) {
        currentTimeLabel.text = time
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
