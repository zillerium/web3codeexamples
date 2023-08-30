const { utils, providers, Wallet } = require('ethers');
const { ganacheProvider } = require('./config');

const provider = new providers.Web3Provider(ganacheProvider);

/**
 * Donate at least 1 ether from the wallet to each charity
 * @param   {string} a hex string private key for a wallet with 10 ETH
 * @param   {array} an array of ethereum charity addresses 
 *
 * @returns {Promise} a promise that resolves after all donations have been sent
 */
async function donate(privateKey, charities) {
    const wallet = new Wallet(privateKey, provider);
    let nonce = await wallet.getTransactionCount();

    const txs = charities.map(async (charity) => {
        const tx = {
            to: charity,
            value: utils.parseEther('1.0'), // sending 1 ether
            nonce: nonce
        };

        nonce++;
        return wallet.sendTransaction(tx);
    });

    return Promise.all(txs);
}



module.exports = donate;
