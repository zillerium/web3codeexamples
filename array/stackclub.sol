// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract StackClub {
    address[] public members;

    constructor() {
        members.push(msg.sender);
    }
   
    function removeLastMember() public isMemberFound(msg.sender) {
        members.pop();
    }

    function addMember(address member) public isMemberFound(msg.sender) {
        members.push(member);

    }

    modifier isMemberFound(address member) {
        require(isMember(member), "Not an existing member");
        _;
    }

    function isMember(address member) public view returns(bool) {
        for (uint i=0;i<members.length;i++) {
            if (members[i] == member) return true;
        }
        return false;
    }
    
}
