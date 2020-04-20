//
//  Utils.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 11/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class Utils {
    static func kelvinToCelcius(_ temp: Double) -> Int{
        return Int((round(temp)) - 273)
    }
    
    static func getCalendar() -> (year: Int, month:Int, day:Int, date:Int, hour: Int, minute: Int, second: Int){
        return (Calendar.current.component(.year, from: Date()),
                Calendar.current.component(.month, from: Date()),
                Calendar.current.component(.weekday, from: Date()),
                Calendar.current.component(.day, from: Date()),
                Calendar.current.component(.hour, from: Date()),
                Calendar.current.component(.minute, from: Date()),
                Calendar.current.component(.second, from: Date()))
    }
    
    static func getTimeStatus() -> TimeStatus{        
        switch getCalendar().hour {
        case 0...4:
            return .EarlyMorning
        case 5...8:
            return .Morning
        case 9...11:
            return .LateMorning
        case 12...15:
            return .Afternoon
        case 16...19:
            return .Evening
        case 20...22:
            return .Night
        default:
            return .Midnight
        }
    }
    
    static func getTimeString(_ timeStatus: TimeStatus) -> String{
        if (timeStatus == .EarlyMorning || timeStatus == .Morning || timeStatus == .LateMorning) {
            return "Pagi"
        } else if (timeStatus == .Afternoon) {
            return "Siang"
        } else if (timeStatus == .Evening) {
            return "Sore"
        } else if (timeStatus == .Night) {
            return "Malam"
        }else {
            return "Tidur"
        }
    }
    
    static func getDay() -> String {
        if self.getCalendar().day == 1 {
            return "Minggu"
        } else if self.getCalendar().day == 2 {
            return "Senin"
        } else if self.getCalendar().day == 3 {
            return "Selasa"
        } else if self.getCalendar().day == 4 {
            return "Rabu"
        } else if self.getCalendar().day == 5 {
            return "Kamis"
        } else if self.getCalendar().day == 6 {
            return "Jumat"
        } else {
            return "Sabtu"
        }
    }
    
    static func getMonth() -> String{
        if self.getCalendar().month == 1 {
            return "Januari"
        } else if self.getCalendar().month == 2 {
            return "Februari"
        } else if self.getCalendar().month == 3 {
            return "Maret"
        } else if self.getCalendar().month == 4 {
            return "April"
        } else if self.getCalendar().month == 5 {
            return "Mei"
        } else if self.getCalendar().month == 6 {
            return "Juni"
        } else if self.getCalendar().month == 7 {
            return "Juli"
        } else if self.getCalendar().month == 8 {
            return "Agustus"
        } else if self.getCalendar().month == 9 {
            return "September"
        } else if self.getCalendar().month == 10 {
            return "Oktober"
        } else if self.getCalendar().month == 11 {
            return "November"
        } else {
            return "Desember"
        }
    }
    
    static func getBriefText() -> String{
        for i in 0...6 {
            if (i+1) == self.getCalendar().day {
                return BriefList.briefList[i]
            }
        }
        return ""
    }
    
    static func getTipsText(_ timeStatus: TimeStatus) -> String {
        if (timeStatus == .EarlyMorning || timeStatus == .Morning || timeStatus == .LateMorning) {
            return TipsList.tips[0]
        } else if (timeStatus == .Afternoon) {
            return TipsList.tips[1]
        } else if (timeStatus == .Evening) {
            return TipsList.tips[2]
        } else if (timeStatus == .Night) {
            return TipsList.tips[3]
        } else {
            return TipsList.tips[4]
        }
    }
    
    static func getToDoList(_ timeStatus: TimeStatus) -> [String]{
        if (timeStatus == .EarlyMorning || timeStatus == .Morning || timeStatus == .LateMorning) {
            return ToDoList.morningToDoLists
        } else if (timeStatus == .Afternoon) {
            return ToDoList.afternoonToDoLists
        } else if (timeStatus == .Evening) {
            return ToDoList.eveningToDoLists
        } else if (timeStatus == .Night) {
            return ToDoList.nightToDoLists
        } else {
            return ToDoList.midnightToDoLists
        }
    }
    
    static func getWeatherResponseParser(data: Data) throws -> WeatherResponse {
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
    
    static func getRewardResponseParser(data: Data) throws -> [RewardResponse] {
        return try JSONDecoder().decode([RewardResponse].self, from: data)
    }
    
    static func getMotivationResponseParser(data: Data) throws -> [MotivationResponse] {
        return try JSONDecoder().decode([MotivationResponse].self, from: data)
    }
    
    static func createAlert(controller: UIViewController, title: String, message: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
    }
    
    
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {

        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {

        self.lockOrientation(orientation)

        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}
