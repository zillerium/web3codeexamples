// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint a, uint b) internal pure returns (bool) {
        return a % b == 0;
    }

    function isPrime(uint256 number) public pure returns (bool) {
        if (number <= 1) {
            return false;
        }
        if (number <= 3) {
            return true;
        }
        if (dividesEvenly(number, 2) || dividesEvenly(number, 3)) {
            return false;
        }
        uint256 i = 5;
        while (i * i <= number) {
            if (dividesEvenly(number, i) || dividesEvenly(number, i + 2)) {
                return false;
            }
            i += 6;
        }
        return true;
    }
}

