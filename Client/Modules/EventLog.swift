//
//  Event.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

/*
 The Event Log API was designed to provide an alternative to the native eth_getLogs. Below are the list of supported filter parameters:

 fromBlock, toBlock, address
 topic0, topic1, topic2, topic3 (32 Bytes per topic)
 topic0_1_opr (and|or between topic0 & topic1), topic1_2_opr (and|or between topic1 & topic2), topic2_3_opr (and|or between topic2 & topic3), topic0_2_opr (and|or between topic0 & topic2), topic0_3_opr (and|or between topic0 & topic3), topic1_3_opr (and|or between topic1 & topic3)
 - FromBlock & ToBlock accepts the blocknumber (integer, NOT hex) or 'latest' (earliest & pending is NOT supported yet)
 - Topic Operator (opr) choices are either 'and' or 'or' and are restricted to the above choices only
 - FromBlock & ToBlock parameters are required
 - An address and/or topic(X) parameters are required, when multiple topic(X) parameters are used the topicX_X_opr (and|or operator) is also required
 - For performance & security considerations, only the first 1000 results are return. So please narrow down the filter parameters
 */

extension EtherscanClient {

    // topic x and topic y are of the form {.topic0, .topic1, .topic2, .topic3 }
    public func getEventLog(
        fromBlock: String,
        toBlock: String,
        address: String?,
        topicx: Query.Topic? = nil,
        topicxbytes: String? = nil,
        topicOperator: TopicOperator? = nil,
        topicy: Query.Topic? = nil,
        topicybytes: String? = nil,
        completion: @escaping (Result<[EventLogModel], DataResponseError>) -> Void
    ) {
        var urlQuery: [URLQueryItem] = []

        urlQuery.append(URLQueryItem(name: .fromBlock, value: fromBlock))
        urlQuery.append(URLQueryItem(name: .toBlock, value: toBlock))

        if let address = address {
            urlQuery.append(URLQueryItem(name: .address, value: address))
        }

        if let topicx = topicx, let topicxbytes = topicxbytes {
            urlQuery.append(URLQueryItem(name: topicx.rawValue, value: topicxbytes))
        }

        if let topicOperator = topicOperator {
            if let topicx = topicx, let topicy = topicy {
                switch topicx {
                case .topic0:
                    switch topicy {
                    case .topic1:
                        urlQuery.append(URLQueryItem(name: Query.topic0_1_opr, value: topicOperator.rawValue))
                    case .topic2:
                        urlQuery.append(URLQueryItem(name: Query.topic0_2_opr, value: topicOperator.rawValue))
                    case .topic3:
                        urlQuery.append(URLQueryItem(name: Query.topic0_3_opr, value: topicOperator.rawValue))
                    default:
                        completion(Result.failure(.arguments))
                    }
                case .topic1:
                    switch topicy {
                    case .topic2:
                        urlQuery.append(URLQueryItem(name: Query.topic1_2_opr, value: topicOperator.rawValue))
                    case .topic3:
                        urlQuery.append(URLQueryItem(name: Query.topic1_3_opr, value: topicOperator.rawValue))
                    default:
                        completion(Result.failure(.arguments))
                    }
                case .topic2:
                    switch topicy {
                    case .topic3:
                        urlQuery.append(URLQueryItem(name: Query.topic2_3_opr, value: topicOperator.rawValue))
                    default:
                        completion(Result.failure(.arguments))
                    }
                default:
                    completion(Result.failure(.arguments))
                }
            } else {
                completion(Result.failure(.arguments))
            }
        }

        if let topicy = topicy, let topicybytes = topicybytes {
            urlQuery.append(URLQueryItem(name: topicy.rawValue, value: topicybytes))
        }

        fetchRemote(val: [EventLogModel].self, module: .logs, action: .getLogs, param: urlQuery, completion: completion)
    }
}
