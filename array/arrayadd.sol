// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    uint[] public evenNumbers;
    uint ind = 0;
    function filterEven(uint[] memory a) public {
        for (uint i=0;i<a.length;i++) {
            if (a[i] % 2 == 0) {
                evenNumbers.push(a[i]);
               // ind++;
            }
        }
    }
    
}
