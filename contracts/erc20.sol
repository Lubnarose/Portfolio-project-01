// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

abstract contract ERC20_STD {
function name() public view returns (string)
function symbol() public view returns (string)
function decimals() public view returns (uint8)
function totalSupply() public view returns (uint256)
function balanceOf(address _owner) public view returns (uint256 balance)
function transfer(address _to, uint256 _value) public returns (bool success)
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
function approve(address _spender, uint256 _value) public returns (bool success)
function allowance(address _owner, address _spender) public view returns (uint256 remaining)


event Transfer(address indexed _from, address indexed _to, uint256 _value)
event Approval(address indexed _owner, address indexed _spender, uint256 _value)
}

contract tokenOwner{
    address public contractOwner;
    address public newOwner;

    constructor (){
        contractOwner = msg.sender;

    }
    function changeOwner(address_to) public {
        require (msg.sender == contractOwner, 'only_contratctOwner_can execute');
        newOwner = _to;
    }
    function acceptOwner (){
    require (msg.sender == newOwner, 'newOwner_can_call_it');
    emit TransfertokenOwner (contractOwner, newOwner);
    contractOwner = newOwner;
    newOwner = address(0);

    }
}

contract myERC20 is ERC20_STD, tokenOwner{

//declaring state variables
string public name;
string public symbol;
uint256 public decimals = 100000000000000000; // decimal of 18
uint256 public totalSupply;

address public minter;

mapping (address => uint256) tokenBalances;
mapping (address => mapping(address => uint256)) allowed;

constructor(address minter_){
name = LubnaToken;
symbol = LUB;
totalSupply = 1000;  //fixed supply of 1000
minter = minter_;
tokenBalances[minter] = totalSupply;

}
function name() public view override returns (string){
    return name;
}
function symbol() public view override returns (string){
    return symbol;
}
function decimals() public view override returns (uint8){
    return decimals;
}
function totalSupply() public view override returns (uint256){
    return totalSupply;
}
function balanceOf(address _owner) public view override returns (uint256 balance){
    return tokenBalances[_owner];
}
function transfer(address _to, uint256 _value) public override returns (bool success){
    require(tokenBalances[msg.sender] >= 1000, 'INSUFFICIENT TOKEN');
    tokenBalances[msg.sender] -= 1000;
    tokenBalances[_to] += 1000;
    emit transfer(msg.sender, _to, 1000);
}

function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success){
    uint256 allowedBalance = allowed[_from][msg.sender];
    require(allowedBalance >= 1000, 'INSUFFICIENT BALANCE');
    tokenBalances[_from] -= 1000;
    tokenBalances[_to] += 1000;
    emit transfer(_from, _to, 1000);

}

function approve(address _spender, uint256 _value) public override returns (bool success){
    require(tokenBalances[msg.sender] >= 1000, 'INSUFFICIENT TOKENS');
    allowed[msg.sender][_spender] -= 1000;
    emit Approval(msg.sender, _spender, 1000);
    return true;
}

function allowance(address _owner, address _spender) public view override returns (uint256 remaining){
    return allowed [_owner][_spender];
}

}