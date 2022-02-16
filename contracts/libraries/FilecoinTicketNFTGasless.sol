// // SPDX-License-Identifier: UNLICENSED

// pragma solidity ^0.8.0;

// //See more at OpenZeppelin:https://docs.openzeppelin.com/contracts/4.x/erc721
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@opengsn/contracts/src/BaseRelayRecipient.sol";
// import "hardhat/console.sol"; //alows for console.logs in a solidity contract"

// contract FilecoinTicketNFTGasless is
//     ERC721URIStorage,
//     BaseRelayRecipient,
//     Ownable
// {
//     using Counters for Counters.Counter;
//     Counters.Counter private _tokenIds;

//     uint256 public maxNFTs;
//     uint256 public remainingMintableNFTs;

//     struct myNFT {
//         address owner;
//         string tokenURI;
//         uint256 tokenId;
//     }

//     mapping(address => bool) hasTicketNFT;
//     myNFT[] public nftCollection;

//     /* tokenURI
//     {
//         "name": "Their name + Filecoin @ Faber Web3 Hack 2022"
//         "description": "NFT created for Faber Web3 Hack 2022 and limited to 100 tokens"
//         "image": //IPFS pinned file content CID (can be any mime type)
//         "other data like version, strenth, etc....": ""
//     }
//     */
//     event NewFilecoinNFTMinted(
//         address sender,
//         uint256 tokenId,
//         string tokenURI
//     );
//     event RemainingMintableNFTChange(uint256 remainingMintableNFTs);

//     //0xFD4973FeB2031D4409fB57afEE5dF2051b171104
//     //This sets our collection details. Anything minted by this contract will fall under this header
//     constructor(address _trustedForwarder)
//         ERC721("Faber Web3 Hack 2022", "Filecoin Starter NFTs")
//     {
//         console.log("This is my NFT contract address:", address(this));
//         maxNFTs = 100; //set a limit to number of nft's that are mintable
//         _setTrustedForwarder(_trustedForwarder);
//     }

//     function mintMyNFT(string memory ipfsURI) public {
//         require(_tokenIds.current() < maxNFTs);
//         // require(!hasTicketNFT[msg.sender]);
//         // hasTicketNFT[_msgSender()] = true;
//         console.log("msg.sender", msg.sender);
//         console.log("_msgSender()", _msgSender());
//         uint256 newItemId = _tokenIds.current();

//         myNFT memory newNFT = myNFT({
//             owner: _msgSender(),
//             tokenURI: ipfsURI,
//             tokenId: newItemId
//         });

//         _safeMint(_msgSender(), newItemId);

//         // Update your URI!!!
//         _setTokenURI(newItemId, ipfsURI);

//         _tokenIds.increment();

//         remainingMintableNFTs = maxNFTs - _tokenIds.current();

//         nftCollection.push(newNFT);

//         emit NewFilecoinNFTMinted(_msgSender(), newItemId, ipfsURI);
//         emit RemainingMintableNFTChange(remainingMintableNFTs);
//     }

//     /**
//      * @notice helper function to display NFTs for frontends
//      */
//     function getNFTCollection() public view returns (myNFT[] memory) {
//         return nftCollection;
//     }

//     function getRemainingMintableNFTs() public view returns (uint256) {
//         return remainingMintableNFTs;
//     }

//     //Functions for gasless ticket minting
//     /**
//      * OPTIONAL
//      * You should add one setTrustedForwarder(address _trustedForwarder)
//      * method with onlyOwner modifier so you can change the trusted
//      * forwarder address to switch to some other meta transaction protocol
//      * if any better protocol comes tomorrow or current one is upgraded.
//      */
//     function setTrustForwarder(address _trustedForwarder) public onlyOwner {
//         _setTrustedForwarder(_trustedForwarder);
//     }

//     /**
//      * Override this function.
//      * This version is to keep track of BaseRelayRecipient you are using
//      * in your contract.
//      */
//     function versionRecipient() external pure override returns (string memory) {
//         return "1";
//     }

//     function _msgSender()
//         internal
//         view
//         override(Context, BaseRelayRecipient)
//         returns (address sender)
//     {
//         sender = BaseRelayRecipient._msgSender();
//     }

//     function _msgData()
//         internal
//         view
//         override(Context, BaseRelayRecipient)
//         returns (bytes memory)
//     {
//         return BaseRelayRecipient._msgData();
//     }
// }
