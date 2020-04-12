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
        print(Utils.getDate())
    }
}
