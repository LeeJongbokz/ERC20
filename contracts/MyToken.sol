pragma solidity ^0.4.21;

import "node_modules/zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract MyToken is MintableToken{
    string public name = "LeeJongbok";
    string public symbol = "LJB";
    uint8 public decimals = 18;
    uint public INITIAL_SUPPLY = 1000000000;

    function MyToken() public{
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}
