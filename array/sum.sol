// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    function sum(uint[5] memory a) pure external returns(uint) {
        uint sum1=0;
        for (uint i=0;i<5;i++) {
            sum1 = sum1 + a[i];
        }
        return sum1;
    }

}
