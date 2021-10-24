// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Variables {
    // State variables are stored on the blockchain.
    uint public num = 123;
    string public hellotext = "Hello";


    //if I just want to return some value, set function state as view
    function getBlockTimeStamp() public view returns (uint){
        uint timestamp = block.timestamp; // Current block timestamp
        return timestamp;
    }
    function getSender () public view returns (address){
        return msg.sender; // just return msg.sender
    }

    // You need to send a transaction to write to a state variable.
    function setnum(uint _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    function getnum() public view returns (uint) {
        return num;
    }
    function gettext() public view returns (string memory){ //You should add memory keyword for string parameter
        return hellotext;
    }


}
