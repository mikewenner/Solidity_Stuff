pragma solidity ^0.5.0;

contract LatestTrade{
    string coin = "BTC";
    uint price;
    bool isBuyOrder;

    function setTrade(string memory newCoin, uint newPrice, bool isBuy) public {
        coin = newCoin;
        price = newPrice;
        isBuyOrder = isBuy;
    }

    function getTrade() view public returns (string memory, uint, bool) {
        return(coin, price, isBuyOrder);
    }

}