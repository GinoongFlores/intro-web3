// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17; 

// internal contracts 

contract myContractA {
    string internal a; 
}

// contract myContractB is myContractA {
//     function getAddress() public view returns (address) {
//         return msg.sender; // calling address
//     }

//     function sendMe() public payable returns (uint) {
//         uint value = msg.value;
//         return value;
//     }

//     // function setA(string memory _a) external {
//     //     a = _a;
//     // }
// }

contract myContractB {
    struct Player {
        string name;
        uint amount;
        bool created;
    }

    mapping(address => Player) public players; 

     function makeCharacter(string memory _name) public payable returns (bool) {
        require(msg.value == 10 ether);
        require(!players[msg.sender].created, "1 Character only"); 


       // CREATED CHARACTER
       players[msg.sender] = Player(_name, msg.value, true); 

        return true;
    }
}