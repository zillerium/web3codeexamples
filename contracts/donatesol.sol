// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
        //console.log(msg.value); // 100000
    }
    
    function tip() public payable {
        //console.log(msg.value); // 100000
        owner.call{value: msg.value}("");
    }

    function donate() public {
         payable(charity).transfer(address(this).balance);

    }
}
