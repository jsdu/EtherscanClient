//
//  ExecutionStatus.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct ExecutionStatusModel: Codable {
    let isError: Bool
    let errDescription: String?

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        isError = try decodedResponse.decode(String.self, forKey: .isError) == "1" ? true : false
        errDescription = Utility.getString(try decodedResponse.decode(String.self, forKey: .errDescription))
    }
}

public struct ReceiptStatusModel: Codable {
    let status: Bool

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        status = try decodedResponse.decode(String.self, forKey: .status) == "1" ? true : false
    }
}
