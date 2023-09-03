// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public required;
    uint public transactionCount;
    uint txnid;
    
    struct Transaction {
        address dest;
        uint256 value;
        bool executed;
    }

    mapping (uint => mapping (address => bool)) public confirmations;
     
    mapping(uint => Transaction) public transactions;

    constructor(address[] memory _owners, uint _required) {
        require(_owners.length > 0, "no owners");
        require(_required > 0, "no confirmations");
        require(_required <= _owners.length, "too few");

        required = _required;
        owners = _owners;
    }

    function addTransaction(address _dest, uint _value) public returns (uint) {
        Transaction memory txn = Transaction({
            dest: _dest,
            value: _value,
            executed: false
        });
        transactions[transactionCount] = txn;
        transactionCount++;
        return (transactionCount - 1);
    }

    function isOwner(address _address) public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (owners[i] == _address) {
                return true;
            }
        }
        return false;
    }


    function confirmTransaction(uint _transactionId) public {
        require(isOwner(msg.sender), "not owner");
        require(!confirmations[_transactionId][msg.sender], "already confirmed");

        confirmations[_transactionId][msg.sender] = true;
    }

}

