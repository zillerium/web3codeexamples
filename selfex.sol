// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    uint8 public tickCount;
    
    constructor() {
        tickCount = 0;
    }
    
    function tick() external {
        require(tickCount < 10, "Tick limit reached");
        tickCount++;
        
        if (tickCount == 10) {
            selfdestruct(payable(address(this)));
        }
    }
}

