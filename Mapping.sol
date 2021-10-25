pragma solidity ^0.8.4;

contract Mapping{
    mapping(address => uint) public myMap;
    function get(address _addr) public view returns(uint){
        return myMap[_addr];
    }
    function set(address _addr, uint _i) public {
        myMap[_addr]=_i;
    }
    function remove(address _addr) public {
        delete myMap[_addr];
    }
}

contract NestedMapping{
    mapping(address => mapping(uint => bool)) public nestedMap;
    function get(address _addr1, uint _i) public view returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        return nestedMap[_addr1][_i];
    }
    function set(address _addr1, uint _i, bool _boo) public {
        nestedMap[_addr1][_i] = _boo;
    }
    function remove(address _addr1, uint _i) public {
        delete nestedMap[_addr1][_i];
    }
}
