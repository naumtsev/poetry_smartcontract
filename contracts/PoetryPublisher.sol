// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract PoetryPublisher is ERC721 {
    using EnumerableSet for EnumerableSet.UintSet;

    uint256 private _currentTokenId;
    
    struct Poem {
        uint256 tokenId;
        string title;
        string text;
    }

    mapping (uint256 => Poem) public poems;
    mapping (uint256 => bool) public poemExists;
    mapping (address => EnumerableSet.UintSet) private authorToTokenIds;

    event PoemPublished(uint256 indexed poemId, address indexed author, string title, string text);

    constructor() ERC721("Poetry Publisher NFT", "PPNFT") {}

    function publishPoem(string memory title, string memory text) public returns (uint256) {
        require(bytes(title).length > 0, "Title cannot be empty");
        require(bytes(text).length > 0, "Text cannot be empty");

        _currentTokenId++;

        uint256 newItemId = _currentTokenId;
        _safeMint(msg.sender, newItemId);
        Poem memory newPoem = Poem({
            tokenId: newItemId,
            title: title,
            text: text
        });

        poems[newItemId] = newPoem;
        authorToTokenIds[msg.sender].add(newItemId);
        poemExists[newItemId] = true;

        emit PoemPublished(newItemId, msg.sender, title, text);

        return newItemId;
    }

    function getPoem(uint256 tokenId) public view returns (string memory title, string memory text) {
        Poem memory poem = poems[tokenId];
        return (poem.title, poem.text);
    }

    function getPoems(address author) public view returns (uint256[] memory) {
        uint256[] memory result = new uint256[](authorToTokenIds[author].length());
        for (uint256 i = 0; i < authorToTokenIds[author].length(); i++) {
            result[i] = authorToTokenIds[author].at(i);
        }
        return result;
    }


    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(poemsContains(tokenId), "URI query for nonexistent token");

        Poem memory poem = poems[tokenId];

        bytes memory dataURI = abi.encodePacked('{"title": "', poem.title, '", "text": "', poem.text, '"}');


        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(dataURI)
            )
        );
    }


    function poemsContains(uint256 poemId) public view returns (bool) {
        return poemExists[poemId];
    }
}
