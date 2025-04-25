// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Test, console} from "forge-std/Test.sol";
import {TreasureManager} from "../src/TreasureManager.sol";

contract TreasureManagerTest is Test {
    TreasureManager public treasureManager;

    function setUp() public {
        treasureManager = new TreasureManager();
    }
}
