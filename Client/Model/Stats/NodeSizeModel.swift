//
//  NodeSizeModel.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

public struct NodeSizeModel: Codable {
    let blockNumber: Int
    let chainTimeStamp: String
    let chainSize: String
    let clientType: String
    let syncMode: String

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        chainTimeStamp = try decodedResponse.decode(String.self, forKey: .chainTimeStamp)
        chainSize = try decodedResponse.decode(String.self, forKey: .chainSize)
        clientType = try decodedResponse.decode(String.self, forKey: .clientType)
        syncMode = try decodedResponse.decode(String.self, forKey: .syncMode)
    }
}
