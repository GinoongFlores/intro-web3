// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17; 


interface ERC20Interface {
    function totalSupply() external view returns (uint);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function transfer(address to, uint tokens) external returns (bool success);
 
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
 
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract Chan is ERC20Interface{
    string public name;
    string public symbol;
    uint256 public decimals; 

    uint256 public totalSupply;

    // address public owner; 

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint)) public allowed; 

    constructor() {
        name = "Chan";
        symbol = "CHN";
        decimals = 0;
        totalSupply = 1000000;
        balances[msg.sender] = totalSupply;
    }

     function balanceOf(address tokenOwner) external view override returns (uint balance) {
            return balances[tokenOwner];
     }

    function transfer(address to, uint tokens) external override returns (bool success) {
        require(balances[msg.sender] >= tokens);
        balances[msg.sender] -= tokens;
        balances[to] += tokens;

        emit Transfer(msg.sender, to, tokens);

        return true; 
     }

     function allowance(address tokenOwner, address spender) external view returns (uint remaining) {
         return allowed[tokenOwner][spender];
     }

     function approve(address spender, uint tokens) external override returns (bool success) {
         require(balances[msg.sender] >= tokens); 
        
        allowed[msg.sender][spender] = tokens; 
        emit Approval(msg.sender, spender, tokens);
        return true;
     }

     function transferFrom(address from, address to, uint tokens) external returns (bool success) {
         require(balances[from] >= tokens);
         require(allowed[from][msg.sender] <= tokens);

         balances[from] -= tokens;
         allowed[from][msg.sender] -= tokens;

         balances[to] += tokens;
         emit Transfer(from, to, tokens); 
         
         return true;

     }


}