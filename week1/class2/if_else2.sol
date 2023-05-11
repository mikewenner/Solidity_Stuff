pragma solidity ^0.5.0;

contract TradeController {
    uint previousPrice;
    string tradeType;

    function makeTrade(uint currentPrice, bool buyAnyway) public {
        if (currentPrice < previousPrice || buyAnyway) {    // the || is or the buyAnyway variable is set to true 
            tradeType = "Buy";
            previousPrice = currentPrice;  //this just updates the price to the most recent price
        }
        else if (currentPrice > previousPrice) {
                tradeType = "Sell";
                previousPrice = currentPrice;
        }
        else {
            tradeType = "Hold";
        }
    }
}