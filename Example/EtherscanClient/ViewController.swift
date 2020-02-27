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
    var fetchingMore = false
    let client = EtherscanClient(apiKey: apiKey, accountAddress: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b")
    var transactions: [TransactionModel] = []
    var page = 1;

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Transactions"

        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "transactionCell")
        beginBatchFetch()
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if offsetY > contentHeight - scrollView.frame.height * 4 {
            if !fetchingMore {
                beginBatchFetch()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return transactions.count
        } 
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)
        cell.textLabel?.text = "Transaction \(transactions[indexPath.row].blockHash)"
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func beginBatchFetch() {
        fetchingMore = true
        print("beginBatchFetch!")
        client.getTransaction(page: page, offset: 20) { result in
            switch result {
            case .success(let result):
                print(result)
                print("hello")
                DispatchQueue.main.async {
                    self.transactions.append(contentsOf: result)
                    self.page = self.page + 1;
                    self.fetchingMore = false
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

