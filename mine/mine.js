const SHA256 = require('crypto-js/sha256');
const TARGET_DIFFICULTY = BigInt(0x0fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
const MAX_TRANSACTIONS = 10;

const mempool = [];
const blocks = [];

function addTransaction(transaction) {
    // TODO: add transaction to mempool
    mempool.push(transaction);
}

function mine() {
    // TODO: mine a block
      
    const block = {
        id: blocks.length,
        transactions: [],
        prevHash: blocks.length > 0 ? SHA256(JSON.stringify(blocks[blocks.length - 1])).toString() : '0',
        nonce: 0
    };

    // Add transactions from mempool to block
    while (block.transactions.length < MAX_TRANSACTIONS && mempool.length > 0) {
        block.transactions.push(mempool.shift());
    }

    // Find a hash that meets the difficulty target
    while (BigInt('0x' + SHA256(JSON.stringify(block)).toString()) > TARGET_DIFFICULTY) {
        block.nonce++;
    }

    // Add the mined block to the blockchain
    blocks.push(block);

}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction, 
    mine, 
    blocks,
    mempool
};
