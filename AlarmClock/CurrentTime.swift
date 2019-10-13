//
//  CurrentTime.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/13.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit

class CurrentTime{

    var timer: Timer?
    var currentTime: String?
    var df = DateFormatter()
    weak var delegate: AwakeViewController?

    init() {
        if timer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
        }
    }

    @objc private func updateCurrentTime(){
        //フォーマットの指定
        df.dateFormat = "HH:mm"
        //時刻をUNIXから端末のタイムゾーンにする
        df.timeZone = TimeZone.current
        //現在の時間をフォーマットに従って文字列化を行う
        let timezoneDate = df.string(from: Date())
        currentTime = timezoneDate
        delegate?.updateTime(currentTime!)
    }
}
