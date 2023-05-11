pragma solidity ^0.5.0;

contract BankAccount {
    address payable accountOwner = 0xc3879B456DAA348a16B6524CBC558d2CC984722c;

    function withdraw(uint amount, address payable recipient) public {
        require(recipient == accountOwner, "You don’t own this account!");  //this replaces the if statement and the "" after is the else, if require is not met the entire transaction is rolled back
        return recipient.transfer(amount);
    }

    function deposit() public payable {}

    function() external payable {}
}