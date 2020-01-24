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
    case contract
    case logs
    case block
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

    // Contract
    case getabi
    case getsourcecode

    // Event
    case getLogs

    // Stats
    case ethsupply
    case ethprice
    case chainsize

    // Block
    case getblockreward
    case getblockcountdown
    case getblocknobytime
}

public enum Query: String {
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

    // Event Log API
    case fromBlock // 'latest', '40000'
    case toBlock  // 'latest', '40000'

    public enum Topic: String {
        case topic0
        case topic1
        case topic2
        case topic3
    }

    case topic0_1_opr
    case topic1_2_opr
    case topic2_3_opr
    case topic0_2_opr
    case topic0_3_opr
    case topic1_3_opr

    case startdate
    case enddate
    case clienttype
    case syncmode

    case blockno
    case timestamp
    case closest
}

public enum Closest: String {
    case before
    case after
}

public enum ClientType: String {
    case geth
    case parity
}

public enum BlockType: String {
    case blocks
    case uncles
}

public enum TopicOperator: String {
    case and
    case or
}
