// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import "./interfaces/ITreasureManager.sol";

contract TreasureManager is Initializable, AccessControlUpgradeable, ReentrancyGuardUpgradeable, OwnableUpgradeable, ITreasureManager {
    using SafeERC20 for IERC20;

    address public constant ethAddress = address(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);

    address public treasureManager;
    address public withdrawManager;

    address[] public tokenWhiteList;

    mapping(address => uint256) public tokenBalances;
    mapping(address => mapping(address => uint256)) public userRewardAmounts;

    error IsZeroAddress();

    event DepositToken(
        address indexed tokenAddress,
        address indexed sender,
        uint256 amount
    );

    event WithdrawToken(
        address indexed tokenAddress,
        address sender,
        address withdrawAddress,
        uint256 amount
    );

    event GrantRewardTokenAmount(
        address indexed tokenAddress,
        address granter,
        uint256 amount
    );

    event WithdrawManagerUpdate(
        address indexed withdrawManager
    );

    modifier onlyTreasureManager() {
        require(msg.sender == address(treasureManager), "TreasureManager.onlyTreasureManager");
        _;
    }

    modifier onlyWithdrawManager() {
        require(msg.sender == address(withdrawManager), "TreasureManager.onlyWithdrawer");
        _;
    }

    function initialize(address _initialOwner, address _treasureManager, address _withdrawManager) public initializer {
        treasureManager = _initialOwner;
        withdrawManager = _withdrawManager;
        _transferOwnership(_initialOwner);
    }

    receive() external payable {
        depositETH();
    }

    function depositETH() public payable nonReentrant returns (bool) {
        tokenBalances[ethAddress] += msg.value;
        emit DepositToken(
            ethAddress,
            msg.sender,
            msg.value
        );
        return true;
    }

    function depositERC20(IERC20 tokenAddress, uint256 amount) external returns (bool) {
        tokenAddress.safeTransferFrom(msg.sender, address(this), amount);
        tokenBalances[address(tokenAddress)] += amount;
        emit DepositToken(
            address(tokenAddress),
            msg.sender,
            amount
        );
        return true;
    }

    function grantRewards(address tokenAddress, address granter, uint256 amount) external onlyTreasureManager {
        require()
    }



}
