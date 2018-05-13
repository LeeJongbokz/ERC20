pragma solidity ^0.4.21;

import "./ERC20.sol";
import "../math/Safemath.sol";

contract MyToken is ERC20{

    using SafeMath for uint256;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowed;

    string public name="LeeJongbok";
    string public symbol="JB";
    uint8 public decimals=18;
    uint public constant INITIAL_SUPPLY=10 ** 9;

    function MyToken() public{
    }

    function transfer(address _to, uint256 _value) public returns (bool){
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
        uint256 allowance = allowed[_from][msg.sender];

        require(allowance >= _value && balanceOf[_from] >= _value);

        balanceOf[_from] = balanceOf[_from].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool){
        allowed[msg.sender][_spender] = _value;
        
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

}
