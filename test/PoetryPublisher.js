const { expect } = require("chai");
const { time, loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { ethers } = require("hardhat");

const contract = require("../artifacts/contracts/PoetryPublisher.sol/PoetryPublisher.json");


describe("Poetry Publisher NFT", function () {
  it("Get poems of signer", async function () {
    const [owner, signer1, signer2] = await ethers.getSigners();;

    const poetryPublisherContract = await ethers.deployContract("PoetryPublisher");

    // const poetryPublisherSigner1 = new ethers.Contract(poetryPublisherContract.address, contract.abi, signer1);
    // const poetryPublisherSigner2 = new ethers.Contract(poetryPublisherContract.address, contract.abi, signer2);
    // const poetryPublisherSigner1 = poetryPublisherContract.connect(signer1)
    // const poetryPublisherSigner2 = poetryPublisherContract.connect(signer2)

    // const singer1Poems = await poetryPublisherSigner1.getPoems(signer1)
    // console.log(signer1.address)
  });

});
