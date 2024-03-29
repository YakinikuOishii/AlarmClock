//
//  Alarm.swift
//  AlarmClock
//
//  Created by 笠原未来 on 2019/10/07.
//  Copyright © 2019 笠原未来. All rights reserved.
//

import UIKit
import AVFoundation

class Alarm{
    var selectedWakeUpTime:Date? = Date()
    var audioPlayer: AVAudioPlayer!
    var sleepTimer: Timer?
    var seconds = 0
    
    //アラーム/タイマーを開始
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        
        if sleepTimer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer(){
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
            
            let soundFilePath = Bundle.main.path(forResource: "bird-and-bag", ofType: "mp3")!
            //パスのURL
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                //AVAudioPlayerを作成
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
                // バックグラウンドでもオーディオ再生可能にする
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
                try AVAudioSession.sharedInstance().setActive(true)
                
            } catch {
                print("Could not load file")
            }
            //再生
            audioPlayer.play()
            print("play")
        }
    }
    
    //起きる時間までの秒数を計算
    private func calculateInterval(userAwakeTime:Date)-> Int{
        //タイマーの時間を計算する
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        
        if interval < 0{
            interval = 86400 - (0 - interval)
        }
        
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
    
    func stopTimer(){
         //sleepTimerがnilじゃない場合
        if sleepTimer != nil {
           //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
        }else{
            //タイマーを止める
            audioPlayer.stop()
        }
    }
}
