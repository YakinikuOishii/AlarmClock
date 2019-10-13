//
//  SettingViewController.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/13.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var alarmDatePicker: UIDatePicker!
    @IBOutlet var sleepTimePicker: UIPickerView!

    var alarm = Alarm()
    
    let dataList:[Any] = [[Int](0...24),[String](arrayLiteral: ":"), [Int](0...60)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alarmDatePicker.datePickerMode = UIDatePicker.Mode.time
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
            //AlarmにあるselectedWakeUpTimeにユーザーの入力した日付を代入
        alarm.selectedWakeUpTime = alarmDatePicker.date
    //        //AlarmのrunTimerを呼ぶ
    //        alarm.runTimer()
            let beforeVC = self.presentingViewController as! ViewController
            beforeVC.setTime = alarmDatePicker.date
            
            dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
            case 0:
                return 100
            case 1:
                return 50
            default:
                return 100
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
