// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;
    bool public isApproved=false;
    
    constructor(address _arbiter, address _beneficiary) payable {
        arbiter=_arbiter;
        beneficiary=_beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        payable(beneficiary).transfer(address(this).balance);
        isApproved=true;
    }
}
