// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SmartWallet {
    mapping(address => uint256) private _balances;
     uint256 private _amount;
    
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function deposit() public payable {
        _balances[msg.sender] += msg.value;
    }
    
    // Exerice 1: 
    function withdrawAmount(uint256 amount_) public {
        require(_balances[msg.sender] > amount_, "SmartWallet: can not withdraw <= 0 ether");
        _balances[msg.sender] = _balances[msg.sender] - amount_; 
        payable(msg.sender).transfer(amount_);
    }
    
    // Exercice 2:
    function transfer(address account_, uint256 amount_) public {
        require(_balances[msg.sender] > amount_, "SmartWallet: can not send more");
        _balances[msg.sender] = _balances[msg.sender] - amount_; 
        _balances[account_] = _balances[account_] + amount_;
    }
    
    function withdraw() public {
        require(_balances[msg.sender] > 0, "SmartWallet: can not withdraw 0 ether");
        uint256 amount_ = _balances[msg.sender];
        _balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount_);
    }
    
    function total() public view returns (uint256) {
        return address(this).balance;
    }
     
}