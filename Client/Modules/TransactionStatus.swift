//
//  TransactionStatus.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

// Transaction Module
extension EtherscanClient {

    /**
     Check Contract Execution Status (if there was an error during contract execution)
     - parameter txHash: Transaction hash
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func checkContractExecutionStatus(txHash: String, completion: @escaping (Result<ExecutionStatusModel, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .txhash, value: txHash)]
        fetchRemote(val: ExecutionStatusModel.self, module: .transaction, action: .getstatus, param: urlQuery, completion: completion)
    }

    /**
     Check Transaction Receipt Status (Only applicable for Post Byzantium fork transactions)
     - parameter txHash: Transaction hash
     - parameter completion: Callback for the outcome of the fetch.
    */
    public func checkTranctionReceiptStatus(txHash: String, completion: @escaping (Result<ReceiptStatusModel, DataResponseError>) -> Void) {
        let urlQuery = [URLQueryItem(name: .txhash, value: txHash)]
        fetchRemote(val: ReceiptStatusModel.self, module: .transaction, action: .gettxreceiptstatus, param: urlQuery, completion: completion)
    }
}
