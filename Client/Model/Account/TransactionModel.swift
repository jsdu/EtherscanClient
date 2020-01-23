//
//  Transaction.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation


public struct TransactionModel: Codable {
    let blockNumber: Int
    let timeStamp: String
    let hash: String
    let nonce: Int
    let blockHash: String
    let transactionIndex: Int?
    let from: String
    let to: String?
    let gas: Int
    let gasPrice: String
    let isError: Bool
    let txreceipt_status: String?
    let input: String?
    let contractAddress: String?
    let cumulativeGasUsed: String?
    let gasUsed: Int?
    let confirmations: Int?

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
