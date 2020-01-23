//
//  Contract.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

// Contract Module
extension EtherscanClient {

    /**
     Get Contract ABI for Verified Contract Source Codes
     - parameter address: Address of the contract
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getContractABI(address: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: String.self, module: .contract, action: .getabi, param: urlQuery, completion: completion)
    }

    /**
     Get Contract Source Code for Verified Contract Source Codes
     Terms of use: https://etherscan.io/source-code-usage-terms
     - parameter address: Address of the contract
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getSourceCode(address: String, completion: @escaping (Result<[SourceCodeModel], DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: [SourceCodeModel].self, module: .contract, action: .getsourcecode, param: urlQuery, completion: completion)
    }
}
