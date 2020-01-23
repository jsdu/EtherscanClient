//
//  Stats.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

// Stats Module
extension EtherscanClient {

    public func getTotalEthSupply(address: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: String.self, module: .stats, action: .ethsupply, param: urlQuery, completion: completion)
    }

    public func getEthLastPrice(completion: @escaping (Result<EthPrice, DataResponseError>) -> Void) {
        fetchRemote(val: EthPrice.self, module: .stats, action: .ethprice, param: [], completion: completion)
    }

    public func getEthNodeSize(
        startDate: String,
        endDate: String,
        clientType: ClientType,
        isArchived: Bool = false,
        completion: @escaping (Result<[NodeSizeModel], DataResponseError>) -> Void
    ) {
        let syncMode = isArchived ? "archive" : "default"
        let urlQuery: [URLQueryItem] = [
            URLQueryItem(name: .startdate, value: startDate),
            URLQueryItem(name: .enddate, value: endDate),
            URLQueryItem(name: .clienttype, value: clientType.rawValue),
            URLQueryItem(name: .syncmode, value: syncMode)
        ]
        
        fetchRemote(val: [NodeSizeModel].self, module: .stats, action: .chainsize, param: urlQuery, completion: completion)
    }
}
