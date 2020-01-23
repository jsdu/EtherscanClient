//
//  Stats.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

// Stats Module
extension EtherscanClient {

    /**
     Get Total Supply of Ether
     - parameter completion:Callback for the outcome of the fetch.
    */
    public func getTotalEthSupply(address: String, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .address, value: address)]
        fetchRemote(val: String.self, module: .stats, action: .ethsupply, param: urlQuery, completion: completion)
    }

    /**
     Gets the ETH price relative to BTC and USD
     - parameter completion:Callback for the outcome of the fetch.
    */
    public func getEthLastPrice(completion: @escaping (Result<EthPrice, DataResponseError>) -> Void) {
        fetchRemote(val: EthPrice.self, module: .stats, action: .ethprice, param: [], completion: completion)
    }

    /**
     Get Ethereum Nodes Size
     - parameter startDate: Start date must be in the form 'yyyy-MM-dd'
     - parameter endDate: End date must be in the form 'yyyy-MM-dd'
     - parameter clientType: Either .geth or .parity
     - parameter isArchived: Flag to set if syncmode is archived or default
     - parameter completion: Callback for the outcome of the fetch.
    */
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
