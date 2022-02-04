//
//  InternalTransaction.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct InternalTransactionModel: Codable {
    public let blockNumber: Int
    public let timeStamp: String
    public let hash: String
    public let from: String
    public let to: String?
    public let contractAddress: String?
    public let input: String?
    public let type: String
    public let gas: Int
    public let gasUsed: Int
    public let traceId: Int?
    public let isError: Bool
    public let errCode: String?

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        timeStamp = try decodedResponse.decode(String.self, forKey: .timeStamp)
        hash = try decodedResponse.decode(String.self, forKey: .hash)
        from = try decodedResponse.decode(String.self, forKey: .from)
        to = Utility.getString(try decodedResponse.decode(String.self, forKey: .to))
        contractAddress = Utility.getString(try decodedResponse.decode(String.self, forKey: .contractAddress))
        input = Utility.getString(try decodedResponse.decode(String.self, forKey: .input))
        type = try decodedResponse.decode(String.self, forKey: .type)
        gas = Int(try decodedResponse.decode(String.self, forKey: .gas))!
        gasUsed = Int(try decodedResponse.decode(String.self, forKey: .gasUsed))!
        traceId = Int(try decodedResponse.decode(String.self, forKey: .traceId))
        isError = try decodedResponse.decode(String.self, forKey: .isError) == "1" ? true : false
        errCode = Utility.getString(try decodedResponse.decode(String.self, forKey: .errCode))
    }
}
