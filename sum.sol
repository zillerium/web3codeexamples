pragma solidity ^0.8.4;

contract Contract {
    function sumAndAverage(uint a, uint b, uint c, uint d) public pure returns (uint[] memory) {
        uint sum = a + b + c + d;
        uint average = sum / 4;
        uint[] memory result = new uint[](2);
        result[0] = sum;
        result[1] = average;
        return result;
    }
}

