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
    
    static func getDate() -> (hour: Int, minute: Int, second: Int){
        return (Calendar.current.component(.hour, from: Date()), Calendar.current.component(.minute, from: Date()), Calendar.current.component(.second, from: Date()))
    }
    
    static func getTimeStatus() -> TimeStatus{        
        switch getDate().hour {
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
}
