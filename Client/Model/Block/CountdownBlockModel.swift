//
//  CountdownBlockModel.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

public struct CountdownBlockModel: Codable {
    let CurrentBlock: Int
    let CountdownBlock: Int
    let RemainingBlock: Int
    let EstimateTimeInSec: Double

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        CurrentBlock = Int(try decodedResponse.decode(String.self, forKey: .CurrentBlock))!
        CountdownBlock = Int(try decodedResponse.decode(String.self, forKey: .CountdownBlock))!
        RemainingBlock = Int(try decodedResponse.decode(String.self, forKey: .RemainingBlock))!
        EstimateTimeInSec = Double(try decodedResponse.decode(String.self, forKey: .EstimateTimeInSec))!
    }
}
