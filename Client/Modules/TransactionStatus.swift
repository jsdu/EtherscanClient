//
//  TransactionStatus.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-21.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public class TransactionStatus: ApiClient {

    /// Check Contract Execution Status (if there was an error during contract execution)
    public func checkContractExecutionStatus(txHash: String, completion: @escaping (Result<ExecutionStatus, DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(txHash: txHash)
        fetchRemote(val: ExecutionStatus.self, module: .transaction, action: .getstatus, param: urlQuery, completion: completion)
    }

    ///Check Transaction Receipt Status (Only applicable for Post Byzantium fork transactions)
    public func checkTranctionReceiptStatus(txHash: String, completion: @escaping (Result<ReceiptStatus, DataResponseError>) -> Void) {
        let urlQuery = getUrlQuery(txHash: txHash)
        fetchRemote(val: ReceiptStatus.self, module: .transaction, action: .gettxreceiptstatus, param: urlQuery, completion: completion)
    }

    private func getUrlQuery(txHash: String) -> [URLQueryItem] {
        var param: [URLQueryItem] = []
        param.append(URLQueryItem(name: .txhash, value: txHash))
        return param
    }

}
