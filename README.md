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

## Transactions

The following calls are part of Etherscan's [Transaction Module](https://etherscan.io/apis#transactions)

### Check Contract Execution Status (if there was an error during contract execution)
```swift
client.checkContractExecutionStatus(txHash: "0x15f8e5ea1079d9a0bb04a4c58ae5fe7654b5b2b4463375ff7ffb490aa0032f3a") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Check Transaction Receipt Status (Only applicable for Post Byzantium fork transactions)
```swift
client.checkContractExecutionStatus(txHash: "0x15f8e5ea1079d9a0bb04a4c58ae5fe7654b5b2b4463375ff7ffb490aa0032f3a") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

##  Blocks

The following calls are part of Etherscan's [Blocks Module](https://etherscan.io/apis#blocks)

### Get Block And Uncle Rewards by BlockNo
```swift
client.getBlockReward(blockno: "2165403") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

###  Get Estimated Block Countdown Time by BlockNo
```swift
client.getBlockCountDown(blockno: "16100000") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

###  Get Block Number by Timestamp
'closest' can either be `.before`, or `.after`
```swift
client.getBlockNo(timestamp: "1578638524", closest: .before) { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```
##  Event Logs
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

### Sample Queries 
```swift
client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Sample Queries
```swift
client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545", topicOperator: .and, topicy: .topic1, topicybytes: "0x72657075746174696f6e00000000000000000000000000000000000000000000") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

## Todo

### Proxy module 
The [Proxy module](https://etherscan.io/apis#proxy) is a limited set of APIs for Geth
Currently, data that is being returned from the Proxy module is all hex encoded. 

### List of verified contract addresses and names
Etherscan published a csv list https://etherscan.io/exportData?type=open-source-contract-codes
