## 合约升级

TreasureManagerScript为部署脚本
TreasureManagerScriptV2为升级脚本

升级内容
```
function getValue() external pure returns(uint256) {
    return 1;
}
```

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Anvil

```shell
$ anvil
```

### 部署合约

```shell
$ forge script ./script/TreasureManagerScript.s.sol:TreasureManagerScript --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

### 查看owner

```shell
$ cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "treasureManager()(address)"
$ cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "owner()(address)"
```



### 转账eth

```shell
$ cast send --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 --value 1000000000000000000

```

### 查看合约eth余额

```shell
$ cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "tokenBalances(address)(uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE
```



### 查看proxyadmin地址

```shell
$ cast storage 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103 --rpc-url 127.0.0.1:8545

0x000000000000000000000000cafac3dd18ac6c6e92c921884f9e4176737c052c
```

### 判断是否为合约

```shell
$ cast code 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 --rpc-url 127.0.0.1:8545
```

### 合约升级
```shell
$ forge script ./script/TreasureManagerScriptV2.s.sol:TreasureManagerScriptV2 --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast
```

### 测试升级函数

```shell
cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "getValue()(uint256)"
```


# erc20 充值
cast call --rpc-url 127.0.0.1:8545 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707 "balanceOf(address)(uint256)" 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
cast send --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707 "approve(address,uint256)" 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 100000000000000000
cast send --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "depositERC20(address,uint256)" 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707 10000000000000000
cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "tokenBalances(address)(uint256)" 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707
# grantRewards
cast send --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "grantRewards(address,address,uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE 0xf917286675f3d40515a38d42c90d27bb2e360c8d 1000000000000000000
cast call --rpc-url 127.0.0.1:8545 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "queryRewards(address)(uint256)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE --from 0xf917286675f3d40515a38d42c90d27bb2e360c8d

## 充值
cast send --rpc-url 127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 0xf917286675f3d40515a38d42c90d27bb2e360c8d --value 1000000000000000000

# eth balance
cast balance 0xf917286675f3d40515a38d42c90d27bb2e360c8d --rpc-url 127.0.0.1:8545

# claim

cast send --rpc-url 127.0.0.1:8545 --private-key 0x01e76c7ccdc819ce1da90341545eba789b97e7740483434ce410849fb994615f 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512 "claimToken(address)" 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE

