//
//  Account.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-18.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

// Account Module
extension EtherscanClient {

    /**
     Get Ether Balance for address.
     Up to a maxium of 20 accounts in a single batch.
     Calling without any parameters will use the default `accountAddress`.
     - parameter addresses: An optional array of addresses, defaults to `nil`.
     - parameter completion: Callback for the outcome of the fetch
    */
    public func getBalance(addresses: [String]? = nil, completion: @escaping (Result<[BalanceModel], DataResponseError>) -> Void) {

        let param: [URLQueryItem]
        if let addresses = addresses {
            if (addresses.count > 20) {
                completion(Result.failure(.arguments))
            }

            param = [URLQueryItem(name: .address, value: addresses.joined(separator: ","))]
        } else {
            param = [URLQueryItem(name: .address, value: accountAddress)]
        }

        fetchRemote(val: [BalanceModel].self, module: .account, action: .balanceMulti, param: param, completion: completion)
    }

    /// Get a paginated list of 'Normal' Transactions By Address
    /// [Optional Parameters] startblock: starting blockNo to retrieve results, endblock: ending blockNo to retrieve results
    /// (Returns up to a maximum of the last 10000 transactions only)
    public func getTransaction(address: String? = nil, startBlock: String? = nil,
                        endBlock: String? = nil, page: Int? = nil, offset: Int? = nil, completion: @escaping (Result<[TransactionModel], DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(address: address, startBlock: startBlock, endBlock: endBlock, page: page, offset: offset)

        fetchRemote(val: [TransactionModel].self, module: .account, action: .txlist, param: urlQuery, completion: completion)
    }

    /// Get a list of 'Internal' Transactions
    /// Specify nil address to search for internal transactions in the instantiated account
    /// Specify a txHash to search for internal transactions by transaction hash. It is inferred that the address is nil
    public func getInternalTransaction(address: String? = nil,
                                txHash: String? = nil,
                                startBlock: String? = nil,
                                endBlock: String? = nil,
                                page: Int? = nil,
                                offset: Int? = nil,
                                completion: @escaping (Result<[InternalTransactionModel], DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(address: address, txHash: txHash, startBlock: startBlock, endBlock: endBlock, page: page, offset: offset)

        fetchRemote(val: [InternalTransactionModel].self, module: .account, action: .txlistinternal, param: urlQuery, completion: completion)
    }

    /// Get a list of "ERC20 - Token Transfer Events" by Address
    public func getErc20Transfers(address: String? = nil,
                           startBlock: String? = nil,
                           endBlock: String? = nil,
                           page: Int? = nil,
                           offset: Int? = nil,
                           contractAddress: String? = nil,
                           completion: @escaping (Result<[Erc20TransferModel], DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(address: address, startBlock: startBlock, endBlock: endBlock, page: page, offset: offset, contractAddress: contractAddress)

        fetchRemote(val: [Erc20TransferModel].self, module: .account, action: .tokentx, param: urlQuery, completion: completion)
    }

    public func getBlocksMined(address: String? = nil,
                        blockType: BlockType = .blocks,
                        page: Int? = nil,
                        offset: Int? = nil,
                        completion: @escaping (Result<[BlockModel], DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(address: address, blockType: blockType, page: page, offset: offset)

        fetchRemote(val: [BlockModel].self, module: .account, action: .getminedblocks, param: urlQuery, completion: completion)

    }

    /// Utility function to build out URL Queries
    private func getUrlQuery(address: String? = nil,
                     txHash: String? = nil,
                     blockType: BlockType? = nil,
                     startBlock: String? = nil,
                     endBlock: String? = nil,
                     page: Int? = nil,
                     offset: Int? = nil,
                     contractAddress: String? = nil) -> [URLQueryItem] {
        let queryAddress = address ?? self.accountAddress

        var param: [URLQueryItem] = []

        if let contractAddress = contractAddress {
            param.append(URLQueryItem(name: .contractaddress, value: contractAddress))
        }

        if let txHash = txHash {
            param.append(URLQueryItem(name: .txhash, value: txHash))
        } else {
            param.append(URLQueryItem(name: .address, value: queryAddress))
        }

        if let blockType = blockType {
            param.append(URLQueryItem(name: .blocktype, value: blockType.rawValue))
        }

        if let startBlock = startBlock, let endBlock = endBlock {
            param.append(contentsOf: [
                URLQueryItem(name: .startBlock, value: startBlock),
                URLQueryItem(name: .endBlock, value: endBlock)
            ])
        }

        if let page = page, let offset = offset {
            param.append(contentsOf: [
                URLQueryItem(name: .page, value: String(page)),
                URLQueryItem(name: .offset, value: String(offset))
            ])
        }
        return param
    }
}
