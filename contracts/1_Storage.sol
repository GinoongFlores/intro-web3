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

    constructor() {
        number = 100;
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

