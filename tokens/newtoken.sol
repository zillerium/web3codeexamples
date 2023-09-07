// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Chest {
    function plunder(address[] memory addr) public {
        for (uint i = 0; i < addr.length; i++) {
            IERC20 token = IERC20(addr[i]);
            uint balance = token.balanceOf(address(this));
            require(token.transfer(msg.sender, balance), "Transfer failed");
        }
    }
}

