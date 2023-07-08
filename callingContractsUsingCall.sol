// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

//calling other contracts using call
contract Counter{
 uint public value;
 function inc(uint x) external payable {
     value+=x;
 }
 function dec() external {
     value-=1;
 }

 function getCount() external  view returns (uint){
     return value;
 }

}



contract useCall {
    
    bytes public data;
    function incExample(address _counterAddress) external payable { //|value of token and gas to be sent //|function name with args here
    (bool success, ) = _counterAddress.call{value:111}(abi.encodeWithSignature("inc(uint256)",5));
    require(success,"faild");
  
    }
      function getExample(address _counterAddress) external  {   
 //return two value a bool and return value from the called function                    //|function name with args here
    (bool success, bytes memory _data) = _counterAddress.call(abi.encodeWithSignature("getCount()"));
    require(success,"faild");
    data=_data;
  
    }

   
}