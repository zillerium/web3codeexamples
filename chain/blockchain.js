const Block = require('./Block');

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
    }

    createGenesisBlock() {
        // create genesis block with arbitrary data and '0' as previousHash
        return new Block("Genesis block", "0");
    }

    getLatestBlock() {
        return this.chain[this.chain.length - 1];
    }

    addBlock(newBlock) {
        // set the previousHash of the new block to the hash of the latest block  
        newBlock.previousHash = this.getLatestBlock().toHash();

        // calculate the hash for the new block after setting previousHash  
        const newHash = newBlock.toHash();

        // push the new block to the chain
        this.chain.push(newBlock);
    }
}

module.exports = Blockchain;

