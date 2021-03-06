# Info

This project is a simple ERC721 (ethereum) NFT minting contract & user interface.
It uses IPFS Protocol to create unique CIDs that point to the NFT data, it then stores this information on Filecoin for reliable & persistent storage.

It takes advantage of the very handy IPFS & Filecoin dev ecosystem tool NFT.Storage to make doing this easy (& free!).

The DApp UI is deployed on fleek.co. Fleek makes it easy to deploy websites and apps on the new open web: permissionless, trustless, censorship resistant, and free of centralized gatekeepers.

You can see the project live here: https://snowy-sun-5772.on.fleek.co/

There is a video explaining the concepts of this project available here: https://www.youtube.com/watch?v=bIZNW_c6Hx4

<img width="1714" alt="Screen Shot 2022-02-18 at 8 16 37 pm" src="https://user-images.githubusercontent.com/12529822/154653665-db2c101d-32de-4da5-b072-ea461cfec84b.png">


# Quick Start:

To run this project you will need metamask, API keys for NFT.Storage, and an ethereum blockchain server like Alchemy, Infura or Moralis + optionally an Etherscan key to verify your contract - see the .env.example.

1. Set up a .env file with the needed API key variables (see .env.example for these) apart from the contract address
```touch .env```

2. Install the project dependencies
```npm install```

3. Run contract locally with hardhat: 

```npx hardhat run scripts/deploys.js ```

Deploy contract to rinkeby ethereum testnet (additionally you could deploy to EVM-compatible networks like polygon, bnb or avax with some hardhat config setup):

```npx hardhat run scripts/deploy.js --network rinkeby```

Add the contract address printed from either of these deployments to your .env file.

Running the front end locally
```npm start```


Additionally, you can verify your contract on etherscan

```npx hardhat verify --network rinkeby --contract contracts/FilecoinTicketNFT.sol:FilecoinTicketNFT DEPLOYED_CONTRACT_ADDRESS```

See your contract deployment on etherscan: https://rinkeby.etherscan.io/address/DEPLOYED_CONTRACT_ADDRESS


# Dependencies

Dev Things (contracts):

- Solidity
- Hardhat
- Alchemy

Ways to save your NFT SVG

1. You can save it in the contrct itself
2. You can save it as an IPFS CID
3. You can use web2... (we wouldn't do that though would we!)


# Further Resources

- Read the IPFS best practice guide for NFT's https://docs.ipfs.io/how-to/mint-nfts-with-ipfs/#a-short-introduction-to-nfts
- See the NFT.School guide https://nftschool.dev/
- Public Gateway status checker: https://ipfs.github.io/public-gateway-checker/
- Faucets for rinkeby eth: https://faucets.chain.link/rinkeby 

# To make this project from scratch:

Dependencies:
Node installed.
Metamask, https://metamask.io/download.html
Moralis Quick server details (or infura/achemy),
etherscan account (for verifying contract)

Tasks - setup:

> npx create-react-app my-app-name
> cd my-app-name
> npm install --save-dev hardhat
> npx hardhat (to get a sample project - choose basic project so we get all the folders. Choose no to gitignore and y to dependencies)

install dependencies:

> npm install --save-dev @nomiclabs/hardhat-waffle ethereum-waffle chai @nomiclabs/hardhat-ethers @nomiclabs/hardhat-etherscan @openzeppelin/contracts
> npm install ethers dotenv

Tasks - development of contract

> touch .env
> add .env to the .gitignore file
> rm ./contracts/Greeter.sol
> rm ./scripts/sample-script.js

> touch ./contracts/FilecoinNFTHack.sol
> touch ./scripts/run.js
> touch ./scripts/deploy.js

Write solidity contract
Write run.js and test your contract

> npx hardhat run scripts/run.js

Tasks - Deployment of Solidity contract
Sign up for Moralis and get a QuickNode
Add it to hardhat config
Sign up for etherscan / get an API key & add it to hardhat.config
networks: {
rinkeby: {
url: process.env.MORALIS_RINKEBY_API_URL,
accounts: [process.env.METAMASK_RINKEBY_PRIVATE_KEY],
},
},
etherscan: {
// Your API key for Etherscan
// Obtain one at https://etherscan.io/
apiKey: process.env.ETHERSCAN_API_KEY,
}

> npx hardhat run scripts/deploy.js --network rinkeby

Tasks - development of front end

- Build the front end
- create a utils folder and put the deployed contract ABI json here

Tasks - deployment of front end

- Use Fleek.co

