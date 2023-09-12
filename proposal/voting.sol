// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    Proposal[] public proposals;
    

    function newProposal(address addr, bytes memory myb) external {
        Proposal memory myp = Proposal(addr, myb, 0, 0);
        proposals.push(myp);
        
    }

  function castVote (uint proposalId, bool vote) external {
    // Check if the proposalId is valid
    require(proposalId < proposals.length, "Invalid proposalId");

    // Cast the vote
    if (vote) {
        proposals[proposalId].yesCount++;
    } else {
        proposals[proposalId].noCount++;
    }
}

    
}

