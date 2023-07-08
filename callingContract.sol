// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

//calling the below contract funtions from this function
contract callTest{
    //calling via address as parameter and than initializing the contract
    function setX(address _test,uint x) external {
        test(_test).setX(x);
    }
    //calling via directly giving the contract as parameter.
    function getX(test _test) external view  returns (uint x) {
        x= _test.getX();
    }
    function send(test _test,uint x) external payable {
        _test.pay{value:msg.value}(x);
    }
     function get2X(test _test) external  view returns (uint x, uint value) {
       ( x,value)= _test.get2X();
    }
}

//call this contract functions from the above contract
contract test{
    uint public x;
    uint public  value;
    function setX(uint _x) external {
             x=_x;
    }
    function getX() external view  returns (uint){
             return x;
    }
    //receive eth
    function pay(uint _x)external  payable {
           x=_x;
           value=msg.value;
    } 
     function get2X() external view   returns (uint, uint ){
             return (x ,value);
    }
    

}