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
       function isMember(address addr) public view returns (bool) {
        return members[addr];
    }

    function removeMember(address addr) public {
        require(members[addr], "Address is not a member");
        
        members[addr] = false;
    }
}

