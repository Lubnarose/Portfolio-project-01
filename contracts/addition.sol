// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
// Solidity program for Addition

contract Addition
{
	// Declaring the state variables
	uint firstNo ;
	uint secondNo ;

	// Defining the function for both variables
	function firstNoSet(uint x) public
	{
		firstNo = x;
	}
    function secondNoSet(uint y) public
	{
		secondNo = y;
	}

	// Defining the function for addition
	function add() view public returns (uint)
	{
		uint Sum = firstNo + secondNo ;
		
		// Sum of two variables
		return Sum;
	}
}
