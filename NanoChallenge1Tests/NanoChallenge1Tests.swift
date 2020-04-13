//
//  NanoChallenge1Tests.swift
//  NanoChallenge1Tests
//
//  Created by Aji Saputra Raka Siwi on 11/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import XCTest
@testable import NanoChallenge1

class NanoChallenge1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKelvinToCelcius() {
        XCTAssertEqual(Utils.kelvinToCelcius(303.15), 30)
    }
    
    func testGetDate(){
        print(Utils.getCalendar())
    }
    
    func testGetDay(){
        print(Utils.getDay())
    }
    
    func testTimeStatus(){
        print(Utils.getTimeStatus())
    }
    
    func testGetMonth(){
        print(Utils.getMonth())
    }
    
    func testWeatherResponseParser(){
        if let path = Bundle.main.path(forResource: "WeatherDummy", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = try Utils.getWeatherResponseParser(data: data)
                print(response.weather[0].icon)
                print(response.main.temp)
            } catch let error {
                // handle error
                print(error.localizedDescription)
            }
        }
    }
}
