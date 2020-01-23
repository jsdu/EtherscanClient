//
//  Block.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct BlockModel: Codable {
    let blockNumber: Int
    let timeStamp: String
    let blockReward: String

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)
        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        timeStamp = try decodedResponse.decode(String.self, forKey: .timeStamp)
        blockReward = try decodedResponse.decode(String.self, forKey: .blockReward)
    }
}

