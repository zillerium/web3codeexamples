/**
 * Set the message on the contract using the signer passed in
 *
 * @param {ethers.Contract} contract - ethers.js contract instance
 * @param {ethers.types.Signer} signer - ethers.js signer instance
 * @return {promise} a promise of transaction modifying the `message`
 */
async function setMessage(contract, signer) {
   const contractWithSigner = await contract.connect(signer);
console.log("contract - ", signer)
    // Modify the message
      await contractWithSigner.modify("new messagemmm");

    // Wait for the transaction to be mined
 
}

module.exports = setMessage;
