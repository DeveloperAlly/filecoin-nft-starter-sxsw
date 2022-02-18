import React from "react";
import faberWeb3HackLogo from "../assets/faber_logo.png";

const Header = () => {
  return (
    <>
      <a
        href="https://hackathons.filecoin.io/"
        target="_blank"
        rel="noreferrer"
      >
        <img
          alt="Faber Web3 Hack Logo"
          style={{ height: "200px", marginLeft: "250px", paddingBottom: "50px" }}
          src={faberWeb3HackLogo}
        ></img>
      </a>
      <p className="header gradient-text">Faber Web3 Hack NFT Collection</p>
      <p className="sub-text">
        100 personalised NFTs for Filecoin @ Faber Web3 Hack 2022
      </p>
    </>
  );
};

export default Header;
