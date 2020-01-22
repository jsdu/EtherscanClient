//
//  APIClient.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-18.
//  Copyright © 2020 Jing Song Du. All rights reserved.
//
import Foundation

public class EtherscanClient {

    let baseUrl = "https://api.etherscan.io/api?"
    let apiKey: String
    let accountAddress: String
    let session: URLSession = URLSession(configuration: .default)

    public init(apiKey: String, accountAddress: String) {
        self.apiKey = apiKey
        self.accountAddress = accountAddress
    }

    func fetchRemote<T: Codable>(val: T.Type, module: Module, action: Action, param: [URLQueryItem], completion: @escaping (Result<T, DataResponseError>) -> Void) {
        if let url = constructUrl(module: module, action: action, param: param) {
            let urlRequest = URLRequest(url: url)
            session.dataTask(with: urlRequest, completionHandler: { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.hasSuccessStatusCode,
                    let data = data else {
                        completion(Result.failure(DataResponseError.network))
                        return
                }
                guard let decodedResponse = try? JSONDecoder().decode(ESResult<T>.self, from: data),
                    let t = decodedResponse.result else {
                    completion(Result.failure(DataResponseError.decoding))
                    return
                }
                if decodedResponse.status == "1" {
                    completion(Result.success(t))
                } else {
                    completion(Result.failure(.message(decodedResponse.message)))
                }
            }).resume()
        } else {
            completion(Result.failure(.url))
        }
    }

    func constructUrl(module: Module, action: Action, param: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseUrl)!
        components.queryItems?.append(URLQueryItem(name: .module, value: module.rawValue))
        components.queryItems?.append(URLQueryItem(name: .action, value: action.rawValue))
        components.queryItems?.append(contentsOf: param)
        components.queryItems?.append(URLQueryItem(name: .apikey, value: apiKey))

        if let url = components.url {
            return url
        }
        return nil
    }
}

public enum DataResponseError: Error {
    case network
    case decoding
    case url
    case arguments
    case message(_: String)
    var reason: String {
        switch self {
        case .network:
            return "An error occurred while fetching data"
        case .decoding:
            return "An error occurred while decoding data"
        case .url:
            return "An error occurred while constructing url"
        case .arguments:
            return "An error occurred in the parameters"
        case .message(let message):
            return message
        }
    }
}

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200...299 ~= statusCode
    }
}

extension URLQueryItem {
    init(name: Query, value: String) {
        self.init(name: name.rawValue, value: value)
    }
}

public enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}
