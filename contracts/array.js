// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint x) external pure returns(uint) {
        return 2*x;
    }

      function double(uint a, uint b) external pure returns(uint[2] memory) {
        return [2*a, 2*b];
    }
}
