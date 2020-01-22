//
//  Balance.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct Balance: Codable {
    let account: String
    let balance: String
}
