// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {

    struct member {
        address addr;
        bool present;
    }
     
    mapping (address => bool) public members;
    address[] public membersArray;    

    function addMember(address addr) public {
        require(!members[addr], "Address is already a member");
        
        members[addr] = true;
        membersArray.push(addr);
    }
}

