import React from "react";

const ImagePreview = ({imgLink, ...props}) => {
return(
    <div style={{marginTop: "20px"}}>
      <img
        src={imgLink}
        alt="NFT image preview"
        height="200px"
        width="300px"
        style={{ backgroundColor: "transparent" }}
      />
    </div>)
}

export default ImagePreview;