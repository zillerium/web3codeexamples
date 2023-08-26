const Block = require('./Block');

class Blockchain {
    constructor() {
        this.chain = [this.createGenesisBlock()];
    }
   isValid() {
    // Start from the second block (index 1) because the genesis block (index 0) doesn't have a previous block
    for (let i = 1; i < this.chain.length; i++) {
      const currentBlock = this.chain[i];
      const previousBlock = this.chain[i - 1];

      // Check if the current block's previousHash (as string) is equal to the hash of the previous block (as string)
      if (currentBlock.previousHash.toString() !== previousBlock.toHash().toString()) {
        return false;
      }
    }

    // All blocks in the chain are valid
    return true;
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

