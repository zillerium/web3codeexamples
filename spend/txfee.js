class Transaction {
    constructor(inputUTXOs, outputUTXOs) {
        this.inputUTXOs=inputUTXOs;
        this.outputUTXOs=outputUTXOs;
        
    }
    execute() {
        for (let utxo of this.inputUTXOs) {
            if (utxo.spent) {
                throw new Error('Double-spending transaction output detected!');
            }
        }

        let inputTotal = this.inputUTXOs.reduce((total, txo) => total + txo.amount, 0);
        let outputTotal = this.outputUTXOs.reduce((total, txo) => total + txo.amount, 0);

        if (inputTotal < outputTotal) {
            throw new Error('Insufficient input value!');
        }

        for (let txo of this.inputUTXOs) {
            txo.spend();
        }
        this.fee = inputTotal - outputTotal;

    }
}

module.exports = Transaction;
