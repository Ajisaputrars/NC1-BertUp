//
//  Utils.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 11/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

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
        case 12...16:
            return .Afternoon
        case 17...19:
            return .Evening
        case 20...22:
            return .Night
        default:
            return .Midnight
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
    
    static func getWeatherResponseParser(data: Data) throws -> WeatherResponse {
        return try JSONDecoder().decode(WeatherResponse.self, from: data)
    }
}
