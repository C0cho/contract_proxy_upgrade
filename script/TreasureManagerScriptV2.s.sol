// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Vm.sol";
import {Script, console } from "forge-std/Script.sol";
import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";
import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

import "../src/TreasureManager.sol";
import "../test/EmptyContract.sol";

contract TreasureManagerScriptV2 is Script {
    TreasureManager public treasureManagerV2Implementation;
    ProxyAdmin public treasureManagerProxyAdmin;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);


        treasureManagerV2Implementation = new TreasureManager();
        treasureManagerProxyAdmin = ProxyAdmin(getProxyAdminAddress(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512));

        treasureManagerProxyAdmin.upgradeAndCall(
            ITransparentUpgradeableProxy(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512),
            address(treasureManagerV2Implementation),
            //升级脚本不能再次初始化
            hex""
        );
        vm.stopBroadcast();
    }


    function getProxyAdminAddress(address proxy) internal view returns (address) {
        address CHEATCODE_ADDRESS = 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D;
        Vm vm = Vm(CHEATCODE_ADDRESS);

        bytes32 adminSlot = vm.load(proxy, ERC1967Utils.ADMIN_SLOT);
        return address(uint160(uint256(adminSlot)));
    }
}
