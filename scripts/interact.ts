// interact.js

const API_URL = process.env.API_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const CONTRACT_ADDRESS = process.env.CONTRACT_ADDRESS;
const ethers = require('ethers');

const contract = require("../artifacts/contracts/PoetryPublisher.sol/PoetryPublisher.json");

// provider - Alchemy
const alchemyProvider = new ethers.providers.JsonRpcProvider(API_URL);

// signer - you
const signer = new ethers.Wallet(PRIVATE_KEY, alchemyProvider);

// contract instance
const poetryPublisherContract = new ethers.Contract(CONTRACT_ADDRESS, contract.abi, signer);


async function getPoemsByAddress(address: string) {
    const poems = await poetryPublisherContract.getPoems(address);
    console.log("Poems for address " + address + ": " + poems);
    return poems;
}

async function getPoemsByCurrentAddress() {
    const address = signer.address;
    return await getPoemsByAddress(address);
}


async function publishPoem(title: string, text: string) {
    const poem_transaction = await poetryPublisherContract.publishPoem(title, text);
    console.log("Poem is published, transaction: " + console.log(JSON.stringify(poem_transaction)));
}


async function getPoemById(id: number) {
    const address = signer.address;
    const data = await poetryPublisherContract.getPoem(id)
    console.log('Data of NFT: ' + data)
    return data;
}


publishPoem("Base poem #1", "Bla bla bla bla")
getPoemsByCurrentAddress()