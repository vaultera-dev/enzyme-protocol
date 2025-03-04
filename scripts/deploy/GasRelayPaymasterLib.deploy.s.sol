// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "forge-std/Script.sol";
import "./../../contracts/release/infrastructure/gas-relayer/GasRelayPaymasterLib.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployGasRelayPaymasterLib is Script {
    //arbitrum
    // address public constant wethToken = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // replace if needed
    // address public constant relayHub = 0x0000000000000000000000000000000000000000;
    // address public constant trustedForwarder = 0x0000000000000000000000000000000000000000;
    // uint256 public constant depositCooldown = 0;
    // uint256 public constant depositMaxTotal = 0;
    // uint256 public constant relayFeeMaxBase = 0;
    // uint256 public constant relayFeeMaxPercent = 0;

    //ethereum
    address public constant wethToken = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;
    address public constant relayHub = 0x9e59ea5333cd4f402dac320a04fafa023fe3810d;
    address public constant trustedForwarder = 0xca57e5d6218aeb093d76372b51ba355cfb3c6cd0;
    uint256 public constant depositCooldown = 86400; // 24 hours in seconds
    uint256 public constant depositMaxTotal = 1000000000000000000; // 1 ETH in wei
    uint256 public constant relayFeeMaxBase = 0;
    uint256 public constant relayFeeMaxPercent = 10;

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        GasRelayPaymasterLib gasRelayPaymasterLib = new GasRelayPaymasterLib(
            wethToken, relayHub, trustedForwarder, depositCooldown, depositMaxTotal, relayFeeMaxBase, relayFeeMaxPercent
        );

        vm.stopBroadcast();

        return (address(gasRelayPaymasterLib));
    }
}
