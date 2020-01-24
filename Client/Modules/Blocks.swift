//
//  Blocks.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-23.
//

import Foundation

// Transaction Module
extension EtherscanClient {

    /**
     Get Block And Uncle Rewards by BlockNo
     - parameter blockno: Block Number
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getBlockReward(blockno: String, completion: @escaping (Result<BlockRewardModel, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .blockno, value: blockno)]
        fetchRemote(val: BlockRewardModel.self, module: .block, action: .getblockreward, param: urlQuery, completion: completion)
    }

    /**
     Get Estimated Block Countdown Time by BlockNo
     - parameter blockno: A future block number
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getBlockCountDown(blockno: String, completion: @escaping (Result<CountdownBlockModel, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .blockno, value: blockno)]
        fetchRemote(val: CountdownBlockModel.self, module: .block, action: .getblockcountdown, param: urlQuery, completion: completion)
    }

    /**
     Get Block Number by Timestamp
     - parameter timestamp: Unix timestamp in seconds
     - parameter closest: Either `.before` or `.after`
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func getBlockNo(timestamp: String, closest: Closest, completion: @escaping (Result<String, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .timestamp, value: timestamp),
                        URLQueryItem(name: .closest, value: closest.rawValue)]
        fetchRemote(val: String.self, module: .block, action: .getblocknobytime, param: urlQuery, completion: completion)
    }
}
