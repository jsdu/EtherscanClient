//
//  ESResult.swift
//  EtherscanClient
//
//  Created by Jason Du on 2020-01-20.
//  Copyright © 2020 Jason Du. All rights reserved.
//

import Foundation

public struct ESResult<T: Codable>: Codable {
    let status: String
    let message: String
    let result: T?
}
