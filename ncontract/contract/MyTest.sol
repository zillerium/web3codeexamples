import "hardhat/console.sol";

contract MyTest {

    uint256 public unlockedTime;
    address payable pulic owner;

    event Withdrawal(uint amount, uint eventTime);
    constructor(uint _unlockedTime) paytable {
        require(block.timestamp < _unlockedTime, "wrong time");
        owner = payable(msg.sender);
    }

    function withdraw() public {
        require(block.timestamp >= unlockedTime, "wait until the period is complete");
        require(msg.sender == owner, "not owner");

        emit withdrawal(address(this).balance, eventTime);

        owner.transfer(address(this).balance);
    }

}
