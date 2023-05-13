/*
msg.sender: Represents the ethereum address that initiated the contract call. It can be an ethereum address or a contract's address.

msg.value: Represents the value of Ether that is sent in the transaction (expressed in Wei).

msg.data: Represents the data payload of the call into our contract (expressed in bytes).

msg.sig: Represents the first four bytes of the data payload.
*/

pragma solidity ^0.5.0;

contract MsgTest {
    uint public balance = 0;
    address public msgSender;
    uint public msgValue;

    function deposit() public payable {
        balance = address(this).balance;  //recall that the "this" refers to this contract
        msgSender = msg.sender;   //the latest sender
        msgValue = msg.value;   //the latest value
    }
}