//
//  RewardResponse.swift
//  NanoChallenge1
//
//  Created by Aji Saputra Raka Siwi on 14/04/20.
//  Copyright © 2020 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

struct RewardResponse: Codable {
    let imageString: String
    let title: String
    let format: String
    let description: String
    let fileBundleString: String
}
