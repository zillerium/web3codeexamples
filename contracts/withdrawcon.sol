// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error WrongSender();

contract Contract {
    address public owner;
    constructor() payable {
        require(msg.value >= 1 ether, "Minimum 1 ether deposit required");
        owner = msg.sender;
    }

   function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw() public  {
        if (msg.sender != owner) {
            revert WrongSender();
        }
        payable(owner).transfer(address(this).balance);
    }
}
