// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17; 

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    uint256 number;
    uint256 value; 

    bytes public b1 = "abc"; 
    string public s1 = "abc";
    mapping(string => uint) public myMapping; 

      struct Player {
        string name;
        uint level;
        uint score; 
    }

       constructor() {
        number = 100;
    }


    mapping(uint => Player) public players;

    enum State {
        Close, // 0
        Started, // 1
        Running, // 2
        Ended // 3
    }

    State public gameState = State.Close;

    function startGame() public {
        gameState = State.Started;
    }


    function fight() public {
        require(gameState == State.Started, "Game still closed!");

        // BLOCK OF CODE
        value = 1;

    }

    function setMapping(uint _id, string memory _name, uint _level, uint _score) public {
        players[_id] = Player(_name, _level, _score);
    }

  
    function addElement() public {
        b1.push("x");
        // s1.push("x");
    }

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    // Setter ni
    function setValue(uint _value) public {
        value = _value;
    }

    // Getter ni
    function getValue() public view returns (uint) {
        return value;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}

