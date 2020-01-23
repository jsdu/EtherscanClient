//
//  Erc20Transfer.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation


public struct Erc20TransferModel: Codable {
    let blockNumber: Int
    let timeStamp: String
    let hash: String
    let nonce: Int
    let blockHash: String
    let from: String
    let contractAddress: String
    let to: String
    let value: String
    let tokenName: String?
    let tokenSymbol: String?
    let tokenDecimal: Int
    let transactionIndex: Int
    let gas: Int
    let gasPrice: String
    let gasUsed: Int
    let cumulativeGasUsed: Int
    let input: String
    let confirmations: String

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        blockNumber = Int(try decodedResponse.decode(String.self, forKey: .blockNumber))!
        timeStamp = try decodedResponse.decode(String.self, forKey: .timeStamp)
        hash = try decodedResponse.decode(String.self, forKey: .hash)
        nonce = Int(try decodedResponse.decode(String.self, forKey: .nonce))!
        blockHash = try decodedResponse.decode(String.self, forKey: .blockHash)
        from = try decodedResponse.decode(String.self, forKey: .from)
        contractAddress = try decodedResponse.decode(String.self, forKey: .contractAddress)
        to = try decodedResponse.decode(String.self, forKey: .to)
        value = try decodedResponse.decode(String.self, forKey: .value)
        tokenName = Utility.getString(try decodedResponse.decode(String.self, forKey: .tokenName))
        tokenSymbol = Utility.getString(try decodedResponse.decode(String.self, forKey: .tokenSymbol))
        tokenDecimal = Int(try decodedResponse.decode(String.self, forKey: .tokenDecimal))!
        transactionIndex = Int(try decodedResponse.decode(String.self, forKey: .transactionIndex))!
        gas = Int(try decodedResponse.decode(String.self, forKey: .gas))!
        gasPrice = try decodedResponse.decode(String.self, forKey: .gasPrice)
        gasUsed = Int(try decodedResponse.decode(String.self, forKey: .gasUsed))!
        cumulativeGasUsed = Int(try decodedResponse.decode(String.self, forKey: .cumulativeGasUsed))!
        input = try decodedResponse.decode(String.self, forKey: .input)
        confirmations = try decodedResponse.decode(String.self, forKey: .confirmations)

    }
}
