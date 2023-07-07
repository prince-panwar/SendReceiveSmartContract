// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SendEth  {
    constructor () payable {}
   function send (address payable _to) external payable{
       bool success;
       (success, )=_to.call{value:123}("");
       require(success,"not sent");
   }
}

contract EthReceive{
    event Log(uint value,uint gas);
   receive() external payable {
       emit Log(msg.value,gasleft());
   }
}