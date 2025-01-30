// SPDX-License-Identifier: MIT 
pragma solidity 0.8.19; 
 
import "forge-std/Script.sol"; 
import "forge-std/console.sol"; 
 
import "./../../../contracts/external-interfaces/IERC20.sol"; 
 
contract CheckVaultBalance is Script { 
 
    address public constant Address = 0x11920f139a3121c2836E01551D43F95B3c31159c; 
  
    function run() external { 
         
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); 
         
        vm.startBroadcast(deployerPrivateKey); 
 
        IERC20 wethCon = IERC20(Address);
 
        uint256 res = wethCon.balanceOf(0x1617664E323A1FBa9FB25ED37Ef7Bb159C8cb200); //vault proxy address
//   Vault Proxy Address: 0x37347Ca35f46E29516ECF41610A3363502a006aF
 
        console.log("res    ", res); //

        vm.stopBroadcast(); 
 
    } 
}