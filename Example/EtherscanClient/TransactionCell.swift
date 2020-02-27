//
//  transactionCell.swift
//  EtherscanClient_Example
//
//  Created by Jing Song Du on 2020-02-27.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import EtherscanClient

class TransactionCell: UITableViewCell {
    var transactionModel: TransactionModel?

    var transactionHashView : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var transactionFromView : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var transactionToView : UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var transactionValueView : UILabel = {
           var label = UILabel()
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addSubview(transactionHashView)
        self.addSubview(transactionFromView)
        self.addSubview(transactionToView)
        self.addSubview(transactionValueView)

        transactionHashView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        transactionHashView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        transactionHashView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40).isActive = true

        transactionFromView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        transactionFromView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50).isActive = true
        transactionFromView.topAnchor.constraint(equalTo: transactionHashView.bottomAnchor, constant: 10).isActive = true

        transactionToView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        transactionToView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -50).isActive = true
        transactionToView.topAnchor.constraint(equalTo: transactionFromView.bottomAnchor, constant: 10).isActive = true

        transactionValueView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        transactionValueView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10).isActive = true
        transactionValueView.topAnchor.constraint(equalTo: transactionToView.bottomAnchor, constant: 10).isActive = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let transactionModel = transactionModel {
            transactionHashView.attributedText = formatString(label: "Tx Hash: ", value: "\(transactionModel.blockHash)")
            transactionFromView.attributedText = formatString(label: "From: ", value: "\(transactionModel.from)")
            transactionToView.attributedText = formatString(label: "To: ", value: "\(transactionModel.to!)")
            transactionValueView.attributedText = formatString(label: "Value: ", value: "\(transactionModel.value) WEI")
        }
    }

    func formatString(label: String, value: String) -> NSMutableAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let txHashLabel = NSMutableAttributedString(string: label, attributes:attrs)
        let txHashString = NSMutableAttributedString(string: value)
        txHashLabel.append(txHashString)
        return txHashLabel
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
