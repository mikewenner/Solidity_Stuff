pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

contract ArcadeToken is ERC20, ERC20Detailed, ERC20Mintable {
    //headers of contract
    constructor(             //constructor is basics that allows the min parms that you need to launch & deploy contract (like min info you would need to setup any online acct)
        string memory name,
        string memory symbol,
        uint initial_supply
    )
        ERC20Detailed(name, symbol, 18) //Define ERC20Detailed -- 18 is the number of 0's after the decimal point --> same scale as etherum network (1ether = 1*10^18 wei)
        public
        //body of contract
    {
        mint(msg.sender, initial_supply);
    }
}