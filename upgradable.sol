// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract test{
    uint public  num;
    address public  owner;
    uint public value;
    function setVars(uint _num)external payable  {
             num=_num*2;
             owner=msg.sender;
             value=msg.value;
     }
    
    
}
 //This contract is calling the test contract via delegatecall so when the function setVars is executed
 //It is exected in context of upgradable contract which means that the state variables of upgradable
 //contract will be updated upon execution of the setVars function of test contract.
contract upgradable{
     uint public num;
     address public owner;
     uint public  value;
    

    function dec(address _callAddress,uint _num) external payable {
      (bool success, ) = _callAddress.delegatecall(abi.encodeWithSelector(test.setVars.selector,_num ));
      require(success, "delegate call failed");
     
    }
    
}
