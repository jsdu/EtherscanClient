//
//  Log.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

// All values in hex
// TODO: Convert to Int
public struct EventLogModel: Codable {
    let address: String
    let topics: [String]
    let data: String
    let blockNumber: String
    let timeStamp: String
    let gasPrice: String
    let gasUsed: String
    let logIndex: String
    let transactionHash: String
    let transactionIndex: String
}
