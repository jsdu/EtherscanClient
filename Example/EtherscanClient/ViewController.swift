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

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Etherscan Client"

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }

        let client = EtherscanClient(apiKey: apiKey, accountAddress: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b")

    }
}

