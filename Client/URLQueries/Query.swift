//
//  Query.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-20.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//

import Foundation

enum Module: String {
    case account
    case transaction
    case stats
    case gastracker
}

enum Action: String {

    // Account
    case balance
    case balanceMulti
    case txlist
    case txlistinternal
    case tokentx
    case getminedblocks

    // Transaction
    case getstatus
    case gettxreceiptstatus

    // Token
    case tokensupply
    case tokenbalance

    // Gas
    case gasestimate
    case gasoracle
}

enum Query: String {
    case module
    case action
    case apikey
    case address
    case startBlock
    case endBlock
    case page
    case offset
    case contractaddress
    case txhash
    case blocktype
    case gasprice
}

public enum BlockType: String {
    case blocks
    case uncles
}
