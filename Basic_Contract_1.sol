pragma solidity ^0.5.0;

contract ArrayPractice{
    uint [] public ids;

    function Add(uint id) public {
        ids.push(id);
    }

    function GetPos(uint pos) view public returns(uint){
        return ids[pos];
    }

    function GetAll() view public returns(uint[] memory ){
        return ids;
    }

    function length() view public returns(uint ){
        return ids.length;
    }

}
