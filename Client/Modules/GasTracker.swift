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

    /**
     Get Estimation of Confirmation Time
     - parameter gasPrice: The gas price in wei
     - parameter completion: The callback which will return the estimated time in seconds
    */
    public func getGasEstimationTime(gasPrice: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .gasprice, value: gasPrice)]
        fetchRemote(val: String.self, module: .gastracker, action: .gasestimate, param: urlQuery, completion: completion)
    }

    /**
     Get Gas Oracle returns a GasModel
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getGasOracle(completion: @escaping (Result<GasModel, DataResponseError>) -> Void) {
        fetchRemote(val: GasModel.self, module: .gastracker, action: .gasoracle, param: [], completion: completion)
    }
}
