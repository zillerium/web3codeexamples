const ethers = require('ethers');

/**
 * Deposit at least 1 ether into the contract 
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @return {promise} a promise of the deposit transaction 
 */
async function deposit(contract) {
          const amount = ethers.utils.parseEther('1.0');

        // Create a transaction to call the 'deposit' function on the contract
        const transaction = await contract.deposit({ value: amount });
}

module.exports = deposit;
