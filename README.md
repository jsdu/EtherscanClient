# EtherscanClient

[![Version](https://img.shields.io/cocoapods/v/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)
[![License](https://img.shields.io/cocoapods/l/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)
[![Platform](https://img.shields.io/cocoapods/p/EtherscanClient.svg?style=flat)](https://cocoapods.org/pods/EtherscanClient)

![](https://etherscan.io/images/logo-ether-white.png?v=0.0.1)

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

### Get Ether Balance
Up to a maxium of 20 accounts in a single batch.
Calling without any parameters will use get the balance of the default `accountAddress`.
`addresses`: An optional array of addresses, defaults to `nil`.

```swift
client.getBalance() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

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

### Get a list of 'Normal' Transactions
- `address`: Optional Address of the transactions. Default is the initial account address
- `startBlock`: Optional start block number
- `endBlock`: Optional end block number
- `page`: Optional page number. Use with offset. If set to nil, query will return up to 10000 transactions.
- `offset`: Optional offset. The number of transactions per page
```swift
/// Gets a list of normal transactions from the default account
client.getTransaction() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

/// Gets a list of normal transactions from an address
client.getTransaction(address: "0x9dd134d14d1e65f84b706d6f205cd5b1cd03a46b") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

/// Get a filtered list of normal Transactions based on start and end block
client.getTransaction(startBlock: "0", endBlock: "99999999") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

/// Get a paginated list of normal Transactions
client.getTransaction(page: "1", offset: "10") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get a list of 'Internal' Transactions 
- `address`: Address of the transactions. Default is the initial account address
- `txHash`: Alternative to querying by addresses. Address must be set to nil for querying txhash
- `startBlock`: Optional start block number
- `endBlock`: Optional end block number
- `page`: Optional page number. Use with offset. If set to nil, query will return up to 10000 transactions.
- `offset`:  Optional offset. The number of transactions per page
```swift
/// Gets a list of internal transactions from the default account 
client.getInternalTransaction() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

/// Get a list of internal transactions by transaction hash
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
  - `address`: Address of the transfer events. Default is the initial account address
  - `startBlock`: Optional start block number
  - `endBlock`: Optional end block number
  - `page`: Optional page number. Use with offset. If set to nil, query will return up to 10000 transactions.
  - `offset`: Optional offset. The number of transactions per page
  - `contractAddress`: The contract address of the ERC20 contract
  ```swift
  /// Get a list of all ERC20 token transfers from the default account
  client.getErc20Transfers() { result in
      switch result {
      case .success(let result):
          print(result)
      case .failure(let error):
          print(error)
      }
  }
  
  /// Get a list of ERC20 transfers from a specific ERC20 token
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
- `address`: Address of the blocks. Default is the initial account address
- `blockType`: Either `.blocks` or `.uncles`. By default, it's `.blocks`
- `page`: Optional page number. Use with offset. If set to nil, query will return up to 10000 transactions.
- `offset`: The number of transactions per page
```swift
client.getBlocksMined() { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

/// Getting uncle blocks mined
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
- `address`: Address of the contract
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
- `address`: Address of the contract
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
- `txHash`: Transaction hash
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
- `txHash`: Transaction hash
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
- `blockno`: Block Number
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
- `blockno`: Block Number
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
- `timestamp`: Unix timestamp in seconds
- `closest`: Either `.before` or `.after`
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

The following calls are part of Etherscan's [Events Module](https://etherscan.io/apis#logs)

### Get Event Logs
The Event Log API was designed to provide an alternative to the native eth_getLogs.
For performance & security considerations, only the first 1000 results are return. Please narrow down the filter parameters
- `fromBlock`: The block number as an integer or 'latest'
- `toBlock`: The block number as an integer or 'latest'
- `address`: Address of the event
- `topicx`: `.topic0`, `. topic1`, `. topic2`, or `.topic3`
- `topicxbytes`: topicx bytes (32 bytes)
- `topicOperator`: Use only when including topic y. Either `.and`, `.or`
- `topicy`: Use `.topic1`, `.topic2`, or `.topic3`
- `topicybytes`: topicy bytes (32 bytes)
```swift
client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

client.getEventLog(fromBlock: "379224", toBlock: "latest", address: "0x33990122638b9132ca29c723bdf037f1a891a70c", topicx: .topic0, topicxbytes: "0xf63780e752c6a54a94fc52715dbc5518a3b4c3c2833d301a204226548a2a8545", topicOperator: .and, topicy: .topic1, topicybytes: "0x72657075746174696f6e00000000000000000000000000000000000000000000") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

## Token
The following calls are part of Etherscan's [Tokens Module](https://etherscan.io/apis#tokens)


### Get ERC20-Token TotalSupply by ContractAddress
`contractAddress`: Address of the ERC20 Token
```swift
client.getErc20TotalSupply(contractAddress: "0x57d90b64a1a57749b0f932f1a3395792e12e7055") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get ERC20-Token Account Balance for TokenContractAddress
`contractAddress`: Address of the ERC20 Token
`address`: Address of the account
```swift
client.getErc20AccountBalance(contractAddress: "0x57d90b64a1a57749b0f932f1a3395792e12e7055", address: "0xe04f27eb70e025b78871a2ad7eabe85e61212761") { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

## Gas Tracker

### Get Estimation of Confirmation Time
- `gasPrice`: The gas price in wei
```swift
client.getGasEstimationTime(gasPrice: "2000000000") { result in 
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get gas oracle
```swift
client.getGasOracle { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```
## Stats

The following calls are part of Etherscan's [Stats Module](https://etherscan.io/apis#stats)

### Get Total Supply of Ether
```swift
client.getTotalEthSupply { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```
### Get Ether Last Price in BTC and USD
```swift
client.getEthLastPrice { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}
```

### Get Ethereum Nodes Size
- `startDate`: Start date must be in the form 'yyyy-MM-dd'
- `endDate`: End date must be in the form 'yyyy-MM-dd'
- `clientType`: Either .geth or .parity
- `isArchived`: Optional Flag to set if syncmode is archived or default
```swift
client.getEthNodeSize(startDate: "2019-02-01", endDate: "2019-02-28", clientType: .geth) { result in
    switch result {
    case .success(let result):
        print(result)
    case .failure(let error):
        print(error)
    }
}

client.getEthNodeSize(startDate: "2019-02-01", endDate: "2019-02-28", clientType: .geth, isArchived: true) { result in
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
