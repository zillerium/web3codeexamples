const secp = require("ethereum-cryptography/secp256k1");
const hashMessage = require("./hashMessage");

async function recoverKey(message, signature, recoveryBit) {
    const hash1 = hashMessage(message);
    
    let publicKey = await secp.recoverPublicKey(hash1, signature, recoveryBit);
    return publicKey;
}

module.exports = recoverKey;
