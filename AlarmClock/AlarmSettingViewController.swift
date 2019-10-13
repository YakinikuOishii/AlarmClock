//
//  AlarmSettingViewController.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/04.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    
    var index: Int! = nil
    
    var alarmListVC = AlarmListViewController()
    
    let alarm = Alarm()

    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // UIDatePickerを.timeモードにする
        datePicker.datePickerMode = UIDatePicker.Mode.time
        
        print(index!)
        // 現在の時間をDatePickerに表示
//        datePicker.setDate(Date(), animated: false)
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        //AlarmにあるselectedWakeUpTimeにユーザーの入力した日付を代入
        alarm.selectedWakeUpTime = datePicker.date
//        //AlarmのrunTimerを呼ぶ
//        alarm.runTimer()
        
        alarmListVC.index = index
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toList" {
            let nextVC = segue.destination as! AlarmListViewController
            nextVC.setTime = datePicker.date
            nextVC.index = self.index
        }
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

extension Date {
    var weekday: String {
        let calendar = Calendar(identifier: .gregorian)
        let component = calendar.component(.weekday, from: self)
        let weekday = component - 1
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en")
        return formatter.weekdaySymbols[weekday]
    }
}
