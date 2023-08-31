// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 

contract Contract {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    receive() external payable {
        //console.log(msg.value); // 100000
    }
    
    function tip() public payable {
        //console.log(msg.value); // 100000
        owner.call{value: msg.value}("");
    }
}
