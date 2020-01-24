# EtherscanClient

[![Version](https://img.shields.io/cocoapods/v/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)
[![License](https://img.shields.io/cocoapods/l/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)
[![Platform](https://img.shields.io/cocoapods/p/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)

## Introduction

The Etherscan API Client is a swift port of the [Rest API](https://etherscan.io/apis).


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

EtherscanClient is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EtherscanClient'
```

## Author

Feel free to email me at contact@dujason.com for any questions 

## License

EtherscanClient is available under the MIT license. See the LICENSE file for more info.

## Initialization

The Etherscan Client must be initialized with an api key and an address of an account.

```swift
let client = EtherscanClient(apiKey: "XXXXXXXXXXXXXXXXXX", accountAddress: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b")
```

## Account

The following calls are part of Etherscan's [Account Module](https://etherscan.io/apis#accounts)

### Get Ether Balance for the initial account's address

```swift
client.getBalance() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get Ether balance for multiple addresses in a single call

```swift
let addresses = ["0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a", 
                 "0x63a9975ba31b0b9626b34300f7f627147df1f526",
                 "0x198ef1ec325a96cc354c7266a038be8b5c558f67"]
client.getBalance(addresses: addresses) { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a list of 'Normal' Transactions for the initial account
```swift
client.getTransaction() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a list of 'Normal' Transactions for an address
```swift
client.getTransaction(address: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a filtered list of 'Normal' Transactions based on start and end block
```swift
client.getTransaction(startBlock: "0", endBlock: "99999999") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a paginated list of 'Normal' Transactions
```swift
client.getTransaction(page: "1", offset: "10") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a list of 'Internal' Transactions for an address 
**Note**: The same queries can be applied for normal transactions and internal transactions.
This includes `address`, `startBlock`, `endBlock`, `page`, and `offset`
```swift
client.getInternalTransaction() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a list of 'Internal' Transactions by transaction hash
```swift
client.getInternalTransaction(txhash: "0x40eb908387324f2b575b4879cd9d7188f69c8fc9d87c901b9e2daaea4b442170") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```
  
  ### Get a list of "ERC20 - Token Transfer Events" by Address
  **Note**: The following queries are available `address`, `startBlock`, `endBlock`, `page`, and `offset`
  ```swift
  client.getErc20Transfers() { result in
      switch result {
      case .success(let result):
          print(result)
      case .failure(let error):
          print(error)
      }
  }
  ```
  
  ### Get a list of "ERC20 - Token Transfer Events" by Transaction Hash
  ```swift
  client.getErc20Transfers(contractAddress: "0x9f8f72aa9304c8b593d555f12ef6589cc3a579a2") { result in
      switch result {
      case .success(let result):
          print(result)
      case .failure(let error):
          print(error)
      }
  }
  ```

### Get list of Blocks Mined by Address
**Note**: The following queries are available `address`, `page`, and `offset`
```swift
client.getBlocksMined() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get list of Blocks Mined by Address by blockType 
Blocktype is either `.blocks`, or `.uncles`, by default, it is `.blocks`
```swift
client.getBlocksMined(blockType: .uncles) { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

## Contract

The following calls are part of Etherscan's [Contract Module](https://etherscan.io/apis#contracts)

###  Get Contract ABI for Verified Contract Source Codes
```swift
client.getContractABI(address: "0xBB9bc244D798123fDe783fCc1C72d3Bb8C189413") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

###   Get Contract Source Code for Verified Contract Source Codes
```swift
client.getSourceCode(address: "0xBB9bc244D798123fDe783fCc1C72d3Bb8C189413") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```
