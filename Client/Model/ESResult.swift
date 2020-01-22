//
//  ESResult.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct ESResult<T: Codable>: Codable {
    let status: String
    let message: String
    let result: T?
}
