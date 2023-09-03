// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;
pragma experimental ABIEncoderV2;

contract Contract {
	enum Choices { Yes, No }

	struct Vote {
		Choices choice;
		address voter;
	}
	
	// TODO: make a new createVote function
	function createVote(Choices choice) external view returns (Vote memory) {
		Vote memory newVote = Vote({
			choice: choice,
			voter: msg.sender
		});
		return newVote;
	}
}
