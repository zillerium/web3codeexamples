require('dotenv').config();
const { API_KEY } = process.env;
const axios = require('axios');
const url = `https://eth-mainnet.g.alchemy.com/v2/${API_KEY}`;

async function getTotalBalance(addresses) {
    const batch = [
        // TODO: fill in with several JSON RPC requests
    ];
    addresses.forEach(addr => {
        console.log(addr);
   
        const response =   {
            jsonrpc: "2.0",
            id: 1,
            method: "eth_getBalance", // <-- fill in the method
            params: [addr],  // <-- fill in the params
        };
        batch.push(response);
     });

    const response = await axios.post(url, batch);
    
    // use this if you want to inspect the response data!
     console.log("response == ", response.data);

     let bal = 0;
    response.data.forEach(element => {
        console.log(element);
            const resultValue = parseInt(element.result, 16); // Convert hex string to integer

        bal+=resultValue;
    });
console.log("bal == ", bal);
    return bal;
    // return the total balance of all the addresses 
}

module.exports = getTotalBalance;
