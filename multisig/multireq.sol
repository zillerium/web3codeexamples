// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public required;

    constructor(address[] memory _owners, uint _required)   {
        require(_owners.length >0, "no owners");
          require(_required >0, "no confirmations");
          require(_required <= _owners.length, "too few" );
         required = _required;
         owners = _owners;
    }
  
}

