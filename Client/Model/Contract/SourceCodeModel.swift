//
//  ContractModel.swift
//  EtherscanClient
//
//  Created by Jing Song Du on 2020-01-22.
//

import Foundation

public struct SourceCodeModel: Codable {
    let SourceCode: String
    let ContractName: String
    let CompilerVersion: String
    let OptimizationUsed: Int
    let Runs: Int
    let ConstructorArguments: String
    let Library: String?
    let LicenseType: String?
    let SwarmSource: String?

    public init(from decoder: Decoder) throws {
        let decodedResponse = try decoder.container(keyedBy: CodingKeys.self)

        SourceCode = try decodedResponse.decode(String.self, forKey: .SourceCode)
        ContractName = try decodedResponse.decode(String.self, forKey: .ContractName)
        CompilerVersion = try decodedResponse.decode(String.self, forKey: .CompilerVersion)
        OptimizationUsed = Int(try decodedResponse.decode(String.self, forKey: .OptimizationUsed))!
        Runs = Int(try decodedResponse.decode(String.self, forKey: .Runs))!
        ConstructorArguments = try decodedResponse.decode(String.self, forKey: .ConstructorArguments)
        Library = Utility.getString(try decodedResponse.decode(String.self, forKey: .Library))
        LicenseType = Utility.getString(try decodedResponse.decode(String.self, forKey: .LicenseType))
        SwarmSource = Utility.getString(try decodedResponse.decode(String.self, forKey: .SwarmSource))
    }
}
