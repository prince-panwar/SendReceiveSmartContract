// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

// suppose we do not have access to this code or this code is very big
// but we want to use it in our contract we can do that
//using Interfaces
contract Counter{
 uint public value;
 function inc() external {
     value+=1;
 }
 function dec() external {
     value-=1;
 }

 function getCount() external  view returns (uint){
     return value;
 }

}

interface  ICounter {
    //instead of completing the function we put a semicolon
    function inc()external ;
    function dec ()external ;
   function getCount() external view  returns (uint);
    
}

contract useInterface{
    uint public count;
    //we pass the address of the counter contract and call the ICounter interface to use its functions
    function incExample(address _counterAddress) external {
        ICounter(_counterAddress).inc();
    }
    function getExample(address _counterAddress) external  {
       count = ICounter(_counterAddress).getCount();
    }
}