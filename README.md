
## Compile
```
npx hardhat compile
```

## Deploy


```
npx hardhat run scripts/deploy.js --network sepolia
```


Actual Contract deployed to address: 0x1f2F8fF11c6cBAF1537e6A58C8F5f8820c48B1f4


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
npx hardhat verify --network sepolia $CONTRACT_ADDRESS 'PoetryPublisher'
```