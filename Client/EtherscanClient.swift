//
//  EtherscanClient.swift
//  iOS-Etherscan-Client
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

public class EtherscanClient {

    // Modules
    public let account: Account
    public let transaction: TransactionStatus
    public let token: Token
    public let gas: GasTracker
    public let contract: Contract

    // Shared URL Session
    let session = URLSession(configuration: .default)

    public init(apiKey: String, address: String) {
        account = Account(apiKey: apiKey, address: address, session: session)
        transaction = TransactionStatus(apiKey: apiKey, session: session)
        token = Token(apiKey: apiKey, session: session)
        gas = GasTracker(apiKey: apiKey, session: session)
        contract = Contract(apiKey: apiKey, session: session)
    }
}
