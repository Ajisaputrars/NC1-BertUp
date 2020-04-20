//
//  WeatherPresenter.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class WeatherPresenter {
    func getWeatherResponse(controller: GetWeatherProtocol, service: BTUService, url: String){
        guard let url = URL(string: url) else { return }
        controller.startLoading()
        service.getWeatherData(url: url) { (response, error) in
            controller.stopLoading()
            if error == nil {
                controller.setWeather(weatherResponse: response!)
            }
            else {
                controller.error(error: error!)
            }
        }
    }
}
