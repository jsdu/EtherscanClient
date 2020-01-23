//
//  Event.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

extension EtherscanClient {

    /**
     The Event Log API was designed to provide an alternative to the native eth_getLogs.
     For performance & security considerations, only the first 1000 results are return. So please narrow down the filter parameters
     - parameter fromBlock: The block number as an integer or 'latest'
     - parameter toBlock: The block number as an integer or 'latest'
     - parameter address: Address of the event
     - parameter topicx: `.topic0`, `. topic1`, `. topic2`, or `.topic3`
     - parameter topicxbytes: topicx bytes (32 bytes)
     - parameter topicOperator: Use only when including topic y. Either `.and`, `.or`
     - parameter topicy: Use `.topic1`, `.topic2`, or `.topic3`
     - parameter topicybytes: topicy bytes (32 bytes)
     - parameter completion: Callback for the outcome of the fetch.
    */
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
