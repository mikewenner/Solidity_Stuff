pragma solidity ^0.5.0;

contract ArcadeToken {
    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchange_rate = 100; //for every 1 wei the customer gets 100 arcade tokens

    mapping(address => uint) balances; //the mapping is like dictionary in python address is key => uint is value so account address is mapped to the uint variable of how much is in the account

    function balance() public view returns(uint) {      //this allows to check the balance of account
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public {   //transfer function
        balances[msg.sender] -= value;  //subtracts the wei from sender
        balances[recipient] += value;   //adds it to the recipient
    }

    function purchase() public payable {    //purchase function
        uint amount = msg.value * exchange_rate;    //msg.value is amt of ether is using
        balances[msg.sender] += amount;     
        owner.transfer(msg.value);      //transfers to contract
    }

    function mint(address recipient, uint value) public {       //mint function
        require(msg.sender == owner, "You do not have permission to mint tokens!");  //requires the sender to be owner
        balances[recipient] += value;
    }
}