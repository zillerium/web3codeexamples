// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    //uint[] memory evenNumbers = new uint[](a.length);
    function filterEven(uint[] memory a) public pure returns(uint[] memory ) {
        uint ind =0;
        uint evenCount=0;
        for (uint i=0;i<a.length;i++) {
            if ((a[i] % 2 == 0) && (a[i]>0)) {
                evenCount++;
               // ind++;
            }
        }
        uint[] memory evenNumbers = new uint[](evenCount);
        for (uint i=0;i<a.length;i++) {
            if ((a[i] % 2 == 0) && (a[i]>0)) {
                evenNumbers[ind]=a[i];
                ind++;
               // ind++;
            }
        }

        return evenNumbers;
    }
    
}
