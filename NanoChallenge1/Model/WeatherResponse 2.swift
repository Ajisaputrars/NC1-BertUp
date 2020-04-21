//
//  WeatherModel.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let weather: [WeatherModel]
    let main: WeatherMainModel
}

struct WeatherModel: Codable{
    let icon: String
}

struct WeatherMainModel:Codable {
    let temp: Double
}
