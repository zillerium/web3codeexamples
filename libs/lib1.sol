// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {

    function isEven(uint amount) public pure returns(bool) {
        if ((amount % 2) == 0) {
            return true;
        }
        return false;
    }
    
}
