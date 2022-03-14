import React from "react";
import sxswSmile from "../assets/sxswSmile.svg";

const Header = () => {
  return (
    <>
      <a
        href="https://hackathons.filecoin.io/"
        target="_blank"
        rel="noreferrer"
      >
        <img
          alt="SXSW NFT House Logo"
          style={{ height: "200px", paddingBottom: "50px" }}
          src={sxswSmile}
        ></img>
      </a>
      <p className="header gradient-text">SXSW NFT House NFT Collection</p>
      <p className="sub-text">
        100 personalised NFTs for Filecoin @ SXSW NFT House 2022
      </p>
    </>
  );
};

export default Header;
