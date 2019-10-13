//
//  AlarmListViewController.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/05.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class AlarmListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var navigationBar:UINavigationBar!
    
    var index: Int!
    
    var setTime: Date!
    
    var dayArray: [String] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    var timeArray: [String] = ["7:00","6:00","6:00","6:00","6:00","6:00","6:00"]
    
    let alarm = Alarm()
    
    let rgb = UIColor(red: 0.274, green: 0.266, blue: 0.588, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
//        return formatter.string(from: date)
        
        if setTime != nil {
            
        }else{
            
        }
        
        table.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        navigationBar.barTintColor = rgb

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sleep() {
        table.allowsSelection = false
        alarm.runTimer()
        performSegue(withIdentifier: "toAlarm", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AlarmTableViewCell?
//        cell!.dayLabel.text = dayArray[indexPath.row]
        cell!.dayLabel.text = dayArray[indexPath.row] 
        cell?.timeLabel.text = timeArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = rgb
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index  = indexPath.row
        performSegue(withIdentifier: "toSetting", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSetting" {
            let nextVC = segue.destination as! AlarmSettingViewController
            nextVC.index = index
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
