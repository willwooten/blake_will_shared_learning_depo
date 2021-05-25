// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.1;

//  # 1
//  Send Money to the Smart Contract using Account #1
//  Withdraw the Money using any other Account
// ** Already sounds scarily unsecure **
//
//  Someone funded the Smart Contract
//  But anyone can withdraw to any address
//
//  The Ethereum Virtual Machine has no functionality 
//  to pause Smart Contracts on a protocol-level
//  END RESULT: simplistic access rule that denies 
//      access to anyone except the one who deployed the Smart Contract
//
//  EXAMPLE: a Token Sale that can be paused. 
//  If you have require(paused == false) in all your customer facing functions, 
//  then you can easily pause a Smart Contract.

contract StartStopUpdateExample {
    
    //  # 2 
    //  store address of Smart Contract deployer
    
    address public owner;
    
    //  constructor is a special function.
    //  automatically called during Smart Contract deployment. 
    //  and it can't be called again
    
    bool public stop_trigger;
    
    constructor() {owner = msg.sender;}
    
    //  can receive Ether, it's a payable function
    
    function sendMoney() public payable {}
    
    // setStopTrigger can only be called by the owner
    
    function setStopTrigger(bool _stop_trigger) public {
        
        require(msg.sender == owner, "You are not the owner");
        stop_trigger = _stop_trigger;
    }
    
    //  withdrawAllMoney can only be called if the contract is not paused.
    
    function withdrawAllMoney(address payable _to) public {
        
        //  require() triggers Errors (or throw Exceptions) in Solidity
        //  If the require evaluates to false it will stop the transaction, 
        //  roll-back any changes made so far and emit the error message as String.
        
        //  Everyone can send Ether to our Smart Contract. But only the person who 
        //  deployed the Smart Contract can withdraw.
        
        require(msg.sender == owner, "You are not the owner!");
        require(stop_trigger == false, "Contract Paused");
        
        _to.transfer(address(this).balance);
        
    }
    
}

