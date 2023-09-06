// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Token {
    uint public totalSupply;
    string public name='axx token';
    string public symbol='axx';
    uint8 public decimals = 18;
    
    mapping (address=>uint) bal;

    constructor () {
        totalSupply = 1000 * (10**18);
        bal[msg.sender]=totalSupply;
    }

    function balanceOf(address addr) external view returns(uint) {
          return bal[addr];
    }
    
}
