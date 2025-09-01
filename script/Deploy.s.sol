// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/COIL.sol";

contract DeployScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        address owner = vm.envAddress("OWNER_ADDRESS");
        address welcomeBonusDistributor = vm.envAddress("WELCOME_BONUS_DISTRIBUTOR_ADDRESS");

        vm.startBroadcast(deployerPrivateKey);

        COIL coil = new COIL(owner, welcomeBonusDistributor);

        vm.stopBroadcast();

        console.log("COIL Token deployed to:", address(coil));
        console.log("Owner:", owner);
        console.log("Welcome Bonus Distributor:", welcomeBonusDistributor);
    }
}
