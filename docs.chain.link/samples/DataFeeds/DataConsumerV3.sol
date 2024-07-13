// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import {AggregatorV3Interface} from "@chainlink/contracts@1.1.1/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT THAT USES HARDCODED
 * VALUES FOR CLARITY.
 * THIS IS AN EXAMPLE CONTRACT THAT USES UN-AUDITED CODE.
 * DO NOT USE THIS CODE IN PRODUCTION.
 */

/**
 * If you are reading data feeds on L2 networks, you must
 * check the latest answer from the L2 Sequencer Uptime
 * Feed to ensure that the data is accurate in the event
 * of an L2 sequencer outage. See the
 * https://docs.chain.link/data-feeds/l2-sequencer-feeds
 * page for details.
 */

contract DataConsumerV3 {
    AggregatorV3Interface internal btcUsdPriceFeed;
    AggregatorV3Interface internal ethUsdPriceFeed;
    AggregatorV3Interface internal linkUsdPriceFeed;

    /**
     * Network: Sepolia
     * BTC/USD Aggregator: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
     * ETH/USD Aggregator: 0x694AA1769357215DE4FAC081bf1f309aDC325306
     * LINK/USD Aggregator: 0xc59E3633BAAC79493d908e63626716e204A45EdF
     */
    constructor() {
        btcUsdPriceFeed = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        );
        ethUsdPriceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        linkUsdPriceFeed = AggregatorV3Interface(
            0xc59E3633BAAC79493d908e63626716e204A45EdF
        );
    }

    /**
     * Returns the latest BTC/USD price.
     */
    function getBtcUsdPrice() public view returns (int) {
        (, int price,,,) = btcUsdPriceFeed.latestRoundData();
        return price;
    }

    /**
     * Returns the latest ETH/USD price.
     */
    function getEthUsdPrice() public view returns (int) {
        (, int price,,,) = ethUsdPriceFeed.latestRoundData();
        return price;
    }

    /**
     * Returns the latest SOL/USD price.
     */
    function getLinkUsdPrice() public view returns (int) {
        (, int price,,,) = linkUsdPriceFeed.latestRoundData();
        return price;
    }
}
