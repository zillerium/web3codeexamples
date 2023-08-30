const { Wallet, utils, providers } = require('ethers');
const { ganacheProvider, PRIVATE_KEY } = require('./config');

// TODO: replace undefined with a new web3 provider
//const provider = undefined; 
const provider = new providers.Web3Provider(ganacheProvider);//

const wallet = new Wallet(PRIVATE_KEY, provider);

async function sendEther({ value, to }) {

    const nonce = await provider.getTransactionCount(wallet.address);
    
    const rawTx = { 
        value, 
        to, 
        gasLimit: utils.hexlify(21000), // standard gas limit for Ether transfer
        gasPrice: utils.parseUnits('1.0', 'gwei'), // gas price in Gwei
        nonce 
    };


   // const rawTx = await wallet.signTransaction({ 
   //     value, to, 
   //     gasLimit: 0x5208,
   //     gasPrice: 0x3b9aca00 
   // });

    // TODO: send the transaction and return the transaction promise
    return wallet.sendTransaction(rawTx);
}

module.exports = sendEther;
