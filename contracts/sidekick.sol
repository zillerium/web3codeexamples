// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Sidekick {
    function sendAlert(address hero) external {
        bytes4 signature = bytes4(keccak256("alert()"));

        (bool success, ) = hero.call(abi.encodeWithSelector(signature));

        require(success, "Call to hero's alert function failed");
    }
}

