// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import "./../../contracts/release/peripheral/DepositWrapper.sol";
import "forge-std/console.sol";
import "./Addresses.sol";

contract DeployDepositWrapper is Script {
    // Define constants for the constructor parameters
    address public immutable addressListRegistryAddress = Addresses.ADDRESS_LIST_REGISTRY; // Replace with actual AddressListRegistry address
    uint256 public constant allowedExchangesListId = 5; // Provided allowed exchanges list ID
    address public constant wrappedNativeAssetAddress = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1; // Provided wrapped native asset address

    function run() external returns (address) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch private key for deployment

        vm.startBroadcast(deployerPrivateKey); // Start transaction broadcasting

        // Instantiate the DepositWrapper contract with the provided constructor values
        DepositWrapper depositWrapper =
            new DepositWrapper(addressListRegistryAddress, allowedExchangesListId, IWETH(wrappedNativeAssetAddress));

        vm.stopBroadcast(); // Stop transaction broadcasting

        return (address(depositWrapper)); // Return the deployed contract address
    }
}
