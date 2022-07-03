// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FakeNFTMarketplace {
    //@dev map tokenID to owner addresses
    mapping(uint256 => address) public tokens;
    uint256 nftPrice = 0.1 ether;

    /**
     *@dev purchase() accepts ETH and gives ownership of token to the caller
     */
    function purchase(uint _tokenId) external payable {
        require(msg.value == nftPrice, "Incorrect Price");
        tokens[_tokenId] = msg.sender;
    }

    /**
     *@dev getPrice() gets price of a single NFT
     */
    function getPrice() external view returns (uint) {
        return nftPrice;
    }

    /**
     *@dev available() checks if the token is available for purchase
     */
    function available(uint _tokenId) external view returns (bool) {
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}
