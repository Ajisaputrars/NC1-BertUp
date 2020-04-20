//
//  BTUService.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 13/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class BTUService {
    func getWeatherData(url: URL, _ completion: @escaping (WeatherResponse?, Error?) -> Void){
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            do {
                let jsonResponse = try Utils.getWeatherResponseParser(data: data)
                completion(jsonResponse, error)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
