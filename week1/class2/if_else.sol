pragma solidity ^0.5.0;

/* examples of if else if els in solidity
if (a<10) {a=a+1;} //if a is less than 10 do something in {}
else if (a>10;) {a=a+2;}  //else if a >10 do somehing in {}
else {a=a-1;}. //else do something in {}

&& means both conditins need to be met
|| is or in conditions

*/

contract IfElse {
    uint y;

    function exampleIfElse(uint x) public {
        if (x < 10) {
            y = 0;
        }
        else if (x < 20) {
            y = 1;
        }
        else {
            y = 2;
        }
    }
}