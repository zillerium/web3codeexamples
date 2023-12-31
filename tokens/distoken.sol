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

    function transfer(address addr, uint amount) public {
        require(bal[msg.sender]>=amount, "balance too low");
        bal[msg.sender] -= amount;
        bal[addr] +=amount;
    }

    function balanceOf(address addr) external view returns(uint) {
          return bal[addr];
    }
    
}
