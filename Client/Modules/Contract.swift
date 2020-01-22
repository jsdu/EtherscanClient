//
//  Contract.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

// Contract Module
extension EtherscanClient {

    public func getContractABI(address: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: String.self, module: .contract, action: .getabi, param: urlQuery, completion: completion)
    }

    public func getSourceCode(address: String, completion: @escaping (Result<[SourceCodeModel], DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: [SourceCodeModel].self, module: .contract, action: .getsourcecode, param: urlQuery, completion: completion)
    }
}
