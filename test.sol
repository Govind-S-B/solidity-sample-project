pragma solidity 0.8.10;

contract MyContract{
    mapping(int => int) public map;

    function setKey(int key,int value) public{
        map[key]=value;
    }
}