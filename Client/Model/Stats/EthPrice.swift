//
//  EthPrice.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

public struct EthPrice: Codable {
    let ethbtc: Double
    let ethbtc_timestamp: String
    let ethusd: Double
    let ethusd_timestamp: String

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        ethbtc = Double(try decodedResponse.decode(String.self, forKey: .ethbtc))!
        ethbtc_timestamp = try decodedResponse.decode(String.self, forKey: .ethbtc_timestamp)
        ethusd = Double(try decodedResponse.decode(String.self, forKey: .ethusd))!
        ethusd_timestamp = try decodedResponse.decode(String.self, forKey: .ethusd_timestamp)

    }
}
