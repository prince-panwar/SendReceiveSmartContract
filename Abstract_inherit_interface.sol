// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
//abstract contract
abstract contract absContract  {
  function add(uint x,uint y) external pure virtual  returns(uint c);
}
//inheriting contract

contract addInherit is absContract{
  function add(uint x,uint y) external  pure override  returns (uint c){
       c=x+y;
  }
}

//interface

interface IAddInherit {
  function add(uint x,uint y)external  pure returns (uint c);
  
  }

  //main

  contract main {
    uint public value;
    function add(address _address ,uint x,uint y) external  {
        value=  IAddInherit(_address).add(x,y);
    }
  }
