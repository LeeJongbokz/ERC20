pragma solidity ^0.4.21;

import "../token/MyToken.sol";
import "../math/Safemath.sol";


contract CrowdSale is MyToken{

    using SafeMath for uint256;

    uint256 totalSupply = INITIAL_SUPPLY * (10 ** decimals) ;
    uint256 tokenExchangeRate = 10000;
    uint256 tokenMaxCap = 1000 * (10 ** decimals);
    uint256 tokenMinCap = 500 * (10 ** decimals); 
    uint256 startTime = 1525791600000; // UTC 2018 May 8th Tuesday PM 3:00:00
    uint256 endTime = 1526004000000; // UTC 2018 May 11st Friday AM 2:00:00

    bool public finalized;

    address public ethFundDeposit;
    address public JBFundDeposit;  

    event createJB(address indexed _to, uint256 _value);
    event LogRefund(address indexed _to, uint256 _value);

    function createJBTokens() payable external{
        require(finalized == false);
        require(startTime<= now && now <= endTime);
        require(msg.value != 0);
        
        uint256 checkedSupply;
        uint256 token = msg.value * tokenExchangeRate;

        checkedSupply = totalSupply + token;    
        require(checkedSupply <= tokenMaxCap);

        totalSupply = checkedSupply;

        balanceOf[msg.sender] += token;
        emit createJB(msg.sender, tokens);
    } 

    function finalize() external{
        require(finalized == false);
        require(now >= endTime);
        require(totalSupply >= totalMinCap);
        
        finalized = true;

        require(ethFundDeposit.send(this.balanceOf)== true);
        return true; 
    }    

    function refund() external{
        require(finalized == false);
        require(now > endTime);
        require(totalSupply <= tokenMincap);

        uint256 JBVal = (msg.sender).balanceOf;
        require(JBVal != 0);
        uint256 ethVal;

        totalSupply = totalSupply - JBVal; 
        ethVal = JBVal / tokenExchangeRate;

        emit LogRefund(msg.sender, ethVal);
        require((msg.sender).send(ethVal) == true);
    }

}


    





}