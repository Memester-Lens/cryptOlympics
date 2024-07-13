const contractABI = [
    // ABI from your compiled contract
];
const contractAddress = 'YOUR_CONTRACT_ADDRESS';

const web3 = new Web3('https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID');
const contract = new web3.eth.Contract(contractABI, contractAddress);

const btcPriceElement = document.getElementById('btc-price');
const ethPriceElement = document.getElementById('eth-price');
const linkPriceElement = document.getElementById('link-price');

async function fetchPrices() {
    try {
        const btcPrice = await contract.methods.getBtcUsdPrice().call();
        const ethPrice = await contract.methods.getEthUsdPrice().call();
        const linkPrice = await contract.methods.getLinkUsdPrice().call();

        btcPriceElement.textContent = btcPrice / 1e8; // Adjust the price format as needed
        ethPriceElement.textContent = ethPrice / 1e8; // Adjust the price format as needed
        linkPriceElement.textContent = linkPrice / 1e8; // Adjust the price format as needed
    } catch (error) {
        console.error('Error fetching prices:', error);
    }
}

function scheduleFetch() {
    const now = new Date();
    const nextFetch = new Date();

    nextFetch.setUTCHours(15, 0, 0, 0);

    if (now > nextFetch) {
        nextFetch.setUTCDate(nextFetch.getUTCDate() + 1);
    }

    const delay = nextFetch - now;

    setTimeout(() => {
        fetchPrices();
        setInterval(fetchPrices, 24 * 60 * 60 * 1000); // Fetch every 24 hours
    }, delay);
}

scheduleFetch();
