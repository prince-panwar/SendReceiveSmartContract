// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
 //this is a abstract function
 abstract contract addition{
   function add(uint a,uint b) external  virtual   returns (uint c);
}
//this function inherit abstract function and implement its funtion
//multiple inheritance can be done like contract derived is addition , myContract{} 
//When doing multiple inheritance the contracts namse should in be inorder frmo the leat inheriting to most inheriting 

contract deriverd is addition{
  function add(uint a,uint b) external pure override returns (uint c){
     c=a+b;
  }

}
