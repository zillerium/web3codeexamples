// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public required;

    constructor(address[] memory _owners, uint _required)   {
         required = _required;
         owners = _owners;
    }
  
}

