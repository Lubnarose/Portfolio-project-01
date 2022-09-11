// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract AgeFinder
    {
    // Declaring & initialize the state variable
	uint age = 56 ;
    address owner;
    // Modifier

    modifier onlyOwner() 
    {
        require(
            msg.sender == owner,
            "onjy owner age can call."
        );
        _;
    }
    // Defining the function for variables
    function ownerAge(uint x) public {
      age = x;
   }
   	
    // Defining the function for callind age data
    function getAge() public view returns (uint) {
      return age;
   }
}