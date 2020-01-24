//
//  ResultViewController.swift
//  EtherscanClient_Example
//
//  Created by Jason Du on 2020-01-23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import EtherscanClient


class ResultViewController: UIViewController {
    let model: Codable!

    override func viewDidLoad() {
        let mirror = Mirror(reflecting: model!)
        print(mirror)
    }

    init(model: Codable) {
        self.model = model
        super.init(nibName: "ResultViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not Supported")
    }
}
