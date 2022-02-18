// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

//See more at OpenZeppelin:https://docs.openzeppelin.com/contracts/4.x/erc721
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol"; //alows for console.logs in a solidity contract"

contract FilecoinTicketNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public maxNFTs;
    uint256 public remainingMintableNFTs;

    struct myNFT {
        address owner;
        string tokenURI;
        uint256 tokenId;
    }

    mapping(address => bool) hasTicketNFT;
    myNFT[] public nftCollection;

    /* tokenURI
    {
        "name": "Their name + Filecoin @ Faber Web3 Hack 2022"
        "description": "NFT created for Faber Web3 Hack 2022 and limited to 100 tokens"
        "image": //IPFS pinned file content CID (can be any mime type)
        "other data like version, strenth, etc....": ""
    }
    */
    event NewFilecoinNFTMinted(
        address sender,
        uint256 tokenId,
        string tokenURI
    );
    event RemainingMintableNFTChange(uint256 remainingMintableNFTs);

    //This sets our collection details. Anything minted by this contract will fall under this header
    constructor() ERC721("Faber Web3 Hack 2022", "Filecoin Starter NFTs") {
        console.log("This is my NFT contract address:", address(this));
        maxNFTs = 100; //set a limit to number of nft's that are mintable
    }

    function mintMyNFT(string memory ipfsURI) public {
        require(_tokenIds.current() < maxNFTs);
        //should also check on front end before minting
        require(
            !hasTicketNFT[msg.sender],
            "You have already minted a ticket NFT!"
        ); //get rid of this for demo

        console.log("Minting NFT", msg.sender, ipfsURI);
        uint256 newItemId = _tokenIds.current();

        myNFT memory newNFT = myNFT({
            owner: msg.sender,
            tokenURI: ipfsURI,
            tokenId: newItemId
        });

        _safeMint(msg.sender, newItemId);

        // Update your URI
        _setTokenURI(newItemId, ipfsURI);

        _tokenIds.increment();
        hasTicketNFT[msg.sender] = true;

        remainingMintableNFTs = maxNFTs - _tokenIds.current();

        nftCollection.push(newNFT);

        emit NewFilecoinNFTMinted(msg.sender, newItemId, ipfsURI);
        emit RemainingMintableNFTChange(remainingMintableNFTs);
    }

    /**
     * @notice helper function to display NFTs for frontends
     */
    function getNFTCollection() public view returns (myNFT[] memory) {
        return nftCollection;
    }

    function getRemainingMintableNFTs() public view returns (uint256) {
        return remainingMintableNFTs;
    }

    function ownsTicketNFT(address _a) public view returns (bool) {
        return hasTicketNFT[_a];
    }
}
