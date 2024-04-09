
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