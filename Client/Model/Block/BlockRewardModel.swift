//
//  BlockReward.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

public struct BlockRewardModel: Codable {
    let blockNumber: Int
    let timeStamp: String
    let blockMiner: String
    let blockReward: String
    let uncles: [UncleModel]
    let uncleInclusionReward: String
    
    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        timeStamp = try decodedResponse.decode(String.self, forKey: .timeStamp)
        blockMiner = try decodedResponse.decode(String.self, forKey: .blockMiner)
        blockReward = try decodedResponse.decode(String.self, forKey: .blockReward)
        uncles = try decodedResponse.decode([UncleModel].self, forKey: .uncles)
        uncleInclusionReward = try decodedResponse.decode(String.self, forKey: .uncleInclusionReward)
    }
}

public struct UncleModel: Codable {
    let miner: String
    let unclePosition: Int
    let blockreward: String

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        miner = try decodedResponse.decode(String.self, forKey: .miner)
        unclePosition = Int(try decodedResponse.decode(String.self, forKey: .unclePosition))!
        blockreward = try decodedResponse.decode(String.self, forKey: .blockreward)
    }
}
