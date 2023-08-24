const secp = require("ethereum-cryptography/secp256k1");
const hashMessage = require('./hashMessage');

const PRIVATE_KEY = "6b911fd37cdf5c81d4c0adb1ab7fa822ed253ab0ad9aa18d77257c88b29b718e";

async function signMessage(msg) {
    const hash1 = hashMessage(msg);

    const privKey = Buffer.from(PRIVATE_KEY, "hex");
    const signature = await secp.sign(hash1, privKey);
    console.log("signature = ", signature);
    const rec = await secp.sign(hash1, privKey, { recovered: true });
    console.log("rec = ", rec);

 
    return [ signature, rec[1]  ]
  
}

module.exports = signMessage;
