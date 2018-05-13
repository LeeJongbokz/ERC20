pragma solidity ^0.4.21;



library SafeMath{


    function add(uint256 a, uint256 b) internal pure returns (uint256){
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256){
        uint256 c = a - b;
        assert(a >= b);
        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256){
        uint c = a * b;
        assert(c / a == b);
        return c;
    }
    
    function div(uint256 a, uint256 b) internal pure returns (uint256){
        uint c = a / b;
        return c;
    }

}