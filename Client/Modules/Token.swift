//
//  Token.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

// Token Module
extension EtherscanClient {

    /**
     Get ERC20-Token TotalSupply by ContractAddress
    - parameter contractAddress: Transaction hash
    - parameter completion: Callback for the outcome of the fetch.
    */
    public func getErc20TotalSupply(contractAddress: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(contractAddress: contractAddress)
        fetchRemote(val: String.self, module: .stats, action: .tokensupply, param: urlQuery, completion: completion)
    }

    /**
    Get ERC20-Token Account Balance for TokenContractAddress
    - parameter contractAddress: Address of the token contract
    - parameter address: Address of the account to query
    - parameter completion: Callback for the outcome of the fetch.
    */
    public func getErc20AccountBalance(contractAddress: String, address: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(contractAddress: contractAddress, address: address)
           fetchRemote(val: String.self, module: .account, action: .tokenbalance, param: urlQuery, completion: completion)
    }

    private func getUrlQuery(contractAddress: String, address: String? = nil) -> [URLQueryItem] {
        var param: [URLQueryItem] = []
        param.append(URLQueryItem(name: .contractaddress, value: contractAddress))

        if let address = address {
            param.append(URLQueryItem(name: .address, value: address))
        }
        return param
    }
}
