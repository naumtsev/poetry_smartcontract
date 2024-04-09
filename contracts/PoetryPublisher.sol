// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract PoetryPublisher is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Poem {
        string title;
        string author;
        string text;
    }

    mapping (uint256 => Poem) public poems;

    constructor() ERC721("Poetry NFT", "PNFT") {}

    function publishPoem(string memory title, string memory author, string memory text) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);

        Poem memory newPoem = Poem({
            title: title,
            author: author,
            text: text
        });

        poems[newItemId] = newPoem;
        
        return newItemId;
    }

    function getPoem(uint256 tokenId) public view returns (string memory title, string memory author, string memory text) {
        Poem memory poem = poems[tokenId];

        return (poem.title, poem.author, poem.text);
    }
}