const secp = require("ethereum-cryptography/secp256k1");
const { keccak256 } = require("ethereum-cryptography/keccak");

function getAddress(publicKey) {
    const publicKeyWithoutFirstByte = publicKey.slice(1);

    // Take the keccak hash of the rest of the public key
    const hashBytes = keccak256(publicKeyWithoutFirstByte);

    // Convert the hash to a byte array
   

    // Take the last 20 bytes of the keccak hash
    const address = hashBytes.slice(-20);

    return address;
}

module.exports = getAddress;
