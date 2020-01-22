//
//  GasTracker.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

// Gas Tracker
extension EtherscanClient {

    /// Get Estimation of Confirmation Time
    /// (Result returned in seconds, gasprice value in Wei)
    public func getGasEstimationTime(gasPrice: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .gasprice, value: gasPrice)]
        fetchRemote(val: String.self, module: .gastracker, action: .gasestimate, param: urlQuery, completion: completion)
    }

    /// Get Gas Oracle
    public func getGasOracle(completion: @escaping (Result<GasOracle, DataResponseError>) -> Void) {
        fetchRemote(val: GasOracle.self, module: .gastracker, action: .gasoracle, param: [], completion: completion)
    }
}
