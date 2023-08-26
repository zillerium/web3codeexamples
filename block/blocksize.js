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
    // Create a new block
    const block = {
        id: blocks.length,
        transactions: [],
        prevHash: blocks.length > 0 ? SHA256(JSON.stringify(blocks[blocks.length - 1])).toString() : '0',
        nonce: 0
    };

    // Add transactions from mempool to block and remove them from mempool
    while (block.transactions.length < MAX_TRANSACTIONS && mempool.length > 0) {
        block.transactions.push(mempool.shift());
    }

    // Find a hash that meets the difficulty target
    while (BigInt('0x' + SHA256(JSON.stringify(block)).toString()) > TARGET_DIFFICULTY) {
        block.nonce++;
    }

    // Set the hash property on the block
    block.hash = SHA256(JSON.stringify(block)).toString();

    // Add the mined block to the blockchain
    blocks.push(block);
}


function mine1() {
    // TODO: mine a block
      
    const block = {
        id: blocks.length,
        transactions: [],
        prevHash: blocks.length > 0 ? SHA256(JSON.stringify(blocks[blocks.length - 1])).toString() : '0',
        nonce: 0
    };
    //block.hash = SHA256(JSON.stringify(block)).toString();
    block.hash = SHA256(JSON.stringify({ id: block.id }));

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
    return block.hash;

}

module.exports = {
    TARGET_DIFFICULTY,
    MAX_TRANSACTIONS,
    addTransaction, 
    mine, 
    blocks,
    mempool
};
