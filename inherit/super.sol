// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "./Hero.sol";
//import "./Enemy.sol"; // Assuming the Enemy interface is in a separate file

contract Mage is Hero(50) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Spell);
        super.attack(enemy);

    }
}

contract Warrior is Hero(200) {
    function attack(address enemy) public override {
        Enemy(enemy).takeAttack(AttackTypes.Brawl);
        super.attack(enemy);
    }
}

