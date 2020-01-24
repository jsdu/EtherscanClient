//
//  ViewController.swift
//  EtherscanClient
//
//  Created by Jason Du on 2020-01-18.
//  Copyright © 2020 Jason Du. All rights reserved.
//

import UIKit
import EtherscanClient

class ViewController: UITableViewController {


    let methods = [
        "getGasEstimationTime",

    ]

    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Etherscan Client"

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }

        // Do any additional setup after loading the view.
        let client = EtherscanClient(apiKey: apiKey, accountAddress: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b")

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//        client.getGasEstimationTime(gasPrice: "2000000000") { result in
//            switch result {
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//        client.getGasOracle { result in
//            switch result {
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//                print(error)
//            }
//        }

        //        client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
        //        client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545", topicOperator: .and, topicy: .topic1, topicybytes: "0x72657075746174696f6e00000000000000000000000000000000000000000000") { result in
        //                switch result {
        //                case .success(let result):
        //                    print(result)
        //                case .failure(let error):
        //                    print(error)
        //                }
        //            }
        //        client.getEthNodeSize(startDate: "2019-02-01", endDate: "2019-02-28", clientType: .geth) { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }

//        client.getEthLastPrice { result in
//            switch result {
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//                print(error)
//            }
//        }

        //        client.contract.getContractABI(address: "0xBB9bc244D798123fDe783fCc1C72d3Bb8C189413") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }

        //        client.contract.getSourceCode(address: "0xBB9bc244D798123fDe783fCc1C72d3Bb8C189413") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }

        //        client.token.getErc20TotalSupply(contractAddress: "0x57d90b64a1a57749b0f932f1a3395792e12e7055") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }
        //        client.token.getErc20AccountBalance(contractAddress: "0x57d90b64a1a57749b0f932f1a3395792e12e7055", address: "0xe04f27eb70e025b78871a2ad7eabe85e61212761") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }
        //        client.transaction.checkTranctionReceiptStatus(txHash: "0x513c1ba0bebf66436b5fed86ab668452b7805593c05073eb2d51d3a52f480a76") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }
        //
        //        client.transaction.checkContractExecutionStatus(txHash: "0x15f8e5ea1079d9a0bb04a4c58ae5fe7654b5b2b4463375ff7ffb490aa0032f3a") { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }

        //        client.account.getBalance { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }
        //        client.account.getBlocksMined(blockType: .uncles) { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error.reason)
        //            }
        //        }

        //        client.account.getTransaction(page: 1, offset: 10) { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }

        //        client.account.getInternalTransaction(page: 1, offset: 100) { result in
        //            switch result {
        //            case .success(let result):
        //                print(result)
        //            case .failure(let error):
        //                print(error)
        //            }
        //        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Something"
        return cell
    }
}

