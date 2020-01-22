//
//  GasOracle.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public struct GasOracle: Codable {
    let LastBlock: Int
    let SafeGasPrice: Double
    let ProposeGasPrice: Double
    
    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)
        
        LastBlock = Int(try decodedResponse.decode(String.self, forKey: .LastBlock))!
        SafeGasPrice = Double(try decodedResponse.decode(String.self, forKey: .SafeGasPrice))!
        ProposeGasPrice = Double(try decodedResponse.decode(String.self, forKey: .ProposeGasPrice))!
    }
}
