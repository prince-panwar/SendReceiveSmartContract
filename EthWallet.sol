// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract EthWallet{
   //current user
    address payable public owner;
    
    //constructor set current user and set contract to receive eth
    constructor() payable {
        owner = payable(msg.sender);
    }
    
    //withDraw from wallet only by owner
     function withdraw(uint amount) external{
            require(msg.sender==owner,"Not Autharized");
            (bool success, )=msg.sender.call{value: amount}("");
            require(success,"transcation failed");
        }
        
        //get balance of wallet
        function getBalance () external  view returns (uint) {
            return address(this).balance;
        }

        //getbalance of owner
        function getOwnerBalance() external  view returns (uint){
            return  msg.sender.balance;
        }
       
   
   }