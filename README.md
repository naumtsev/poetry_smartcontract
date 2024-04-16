# Poetry Publisher NFT



## Compile
```
npx hardhat compile
```

## Deploy


```
npx hardhat run scripts/deploy.js --network sepolia
```


Actual Contract deployed to address: 0xC1cF9a92fa9238963a477a649e0F9902096067D8


## Local Envirnment

Before running interact.ts 
```
npx hardhat run scripts/interact.ts --network sepolia
```

create .env file
```
PRIVATE_KEY = "meta mask key"
API_KEY = "alchemy application key"
API_URL = "https alchemy application key"
CONTRACT_ADDRESS = "actual contract adress"
ETHERSCAN_API_KEY = "ETHERSCAN_API_KEY"
```


## Interacting with smart contract
You can run following command which will run script interact.ts

```
npx hardhat run scripts/interact.ts --network sepolia
```

inside script there are 4 defined functions which you can use, don't forget create .env file before

```
async function getPoemsByAddress(address: string)

async function getPoemsByCurrentAddress()


async function publishPoem(title: string, text: string)

async function getPoemById(id: number)
```





## Verify smart contract on Etherscan
```
npx hardhat verify --contract "contracts/PoetryPublisher.sol:PoetryPublisher" --network sepolia 0xC1cF9a92fa9238963a477a649e0F9902096067D8
```


## Poetry Publisher on Etherscan.

https://sepolia.etherscan.io/address/0xC1cF9a92fa9238963a477a649e0F9902096067D8#code


## Adding NFT to Meta mask
```
Metamask -> NFT -> Import NFT -> 
Address: 0xC1cF9a92fa9238963a477a649e0F9902096067D8 (contract address) 
Token ID: [Token ID number] 
(You can obtain it by calling interact.ts or by finding the transaction with the Method "Publish Poem" associated with your wallet address)

```


## Run tests
```
npx hardhat test
```
