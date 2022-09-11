// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Student
{
    //Create a structure for student details
    string name ;
	uint age ;
    uint marks;
    string gender;
    uint class;
    
    // Constructor code is only run when the contract is created
constructor() {
    owner = msg.sender;
    }    
    
    //using require modifier
    modifier onlyOwner{
        require(msg.sender ==owner,"only_Owner_Allow");
    _;
    }
 function addStudent(string calldata _n, uint _a, uint _m, string memory _g, uint _c) public onlyOwner
 student[_add].name = _n;
 student[_add].age = _a
 student[_add].marks = _m;
 student[_add].gender = _g;
 student[_add].class = _c;
 stdArr.push(_add);
    
     // Fetch the student details  with the help of stdData
 function getStdData(address _std)public view returns(string memory,uint,string memory,uint,uint)public 
 return (student[_std].name, student[_std].age, student[_std].marks, student[_std].gender, student[_std].class);
 Std [] abc;
 function getStds() piblic returns(Std[] memory)
     // loop
     for(uint i = 0; i<= StdArr.length; i++){
         abc.push(student[stdArr[i]]);
     }
 return abc;
}