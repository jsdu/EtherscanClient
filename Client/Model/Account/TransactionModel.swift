//
//  Transaction.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation


public struct TransactionModel: Codable {
    public let blockNumber: Int
    public let timeStamp: String
    public let hash: String
    public let nonce: Int
    public let blockHash: String
    public let transactionIndex: Int?
    public let from: String
    public let to: String?
    public let gas: Int
    public let gasPrice: String
    public let isError: Bool
    public let txreceipt_status: String?
    public let input: String?
    public let contractAddress: String?
    public let cumulativeGasUsed: String?
    public let gasUsed: Int?
    public let confirmations: Int?

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)
        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        timeStamp = try decodedResponse.decode(String.self, forKey: .timeStamp)
        hash = try decodedResponse.decode(String.self, forKey: .hash)
        nonce = Int(try decodedResponse.decode(String.self, forKey: .nonce))!
        blockHash = try decodedResponse.decode(String.self, forKey: .blockHash)
        transactionIndex = Int(try decodedResponse.decode(String.self, forKey: .transactionIndex))!
        from = try decodedResponse.decode(String.self, forKey: .from)
        to = Utility.getString(try decodedResponse.decode(String.self, forKey: .to))
        gas = Int(try decodedResponse.decode(String.self, forKey: .gas))!
        gasPrice = try decodedResponse.decode(String.self, forKey: .gasPrice)
        isError = try decodedResponse.decode(String.self, forKey: .isError) == "1" ? true : false
        txreceipt_status = Utility.getString(try decodedResponse.decode(String.self, forKey: .txreceipt_status))
        input = try decodedResponse.decode(String.self, forKey: .input)
        contractAddress = Utility.getString(try decodedResponse.decode(String.self, forKey: .contractAddress))
        cumulativeGasUsed = try decodedResponse.decode(String.self, forKey: .cumulativeGasUsed)
        gasUsed = Int(try decodedResponse.decode(String.self, forKey: .gasUsed))
        confirmations = Int(try decodedResponse.decode(String.self, forKey: .confirmations))
    }
}
