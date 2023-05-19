pragma solidity ^0.5.0;

import "./ArcadeTokenMintable.sol"; //NOTE - this is the .sol file we made for the arcade tokens ... Name of contract must match file name!!
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract ArcadeTokenCrowdsale is Crowdsale, MintedCrowdsale {
    constructor(
        uint rate,  //conversion rate betwn 1 bit to 1 wei
        address payable wallet,  //wallet address of owner/contract deployer
        ArcadeToken token //calling it from arcadetokenmintable
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor body can stay empty
    }
}

contract ArcadeTokenCrowdsaleDeployer { //temp helper contract to delpoy
    address public arcade_token_address;
    address public arcade_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet
    )
        public
    {
        ArcadeToken token = new ArcadeToken(name, symbol, 0); //0 is initial supply, new keyword allows ref the other contract arcadetoken contract in the mintable .sol file
        arcade_token_address = address(token);

        ArcadeTokenCrowdsale arcade_crowdsale = new ArcadeTokenCrowdsale(1, wallet, token);
        arcade_crowdsale_address = address(arcade_crowdsale);

        token.addMinter(arcade_crowdsale_address);
        token.renounceMinter();
    }
}