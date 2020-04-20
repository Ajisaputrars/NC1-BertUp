//
//  WeatherProtocol.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

protocol GetWeatherProtocol {
    func startLoading()
    func stopLoading()
    func setWeather(weatherResponse: WeatherResponse)
    func error(error: Error)
}

extension GetWeatherProtocol {
    func startLoading() {}
    func stopLoading() {}
}
