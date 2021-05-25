// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract SendMoneyExample {
    
    //  balanceReceived public storage variable
    //  lockedUntil locks balance in Smart Contract for 1 minute
    
    uint public balanceReceived;
    uint public lockedUntil;

    function receiveMoney() public payable {

    // msg-object is global: contains .value and .sender

        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    // view function is read-only, can return information
    // doesn't require *mining* so is nearly free

    function getBalance() public view returns(uint) {
        
        // address contains the property .balance = amount stored in contract address. 
        // again, public information
        // address(this) "converts" the Smart Contract instance to address
        // returns the amount of Ether that are stored on the Smart Contract itself
        // Bob sends 10 contract, and contract address keeps it

        return address(this).balance;
    }
    
    // send all funds stored in Smart Contract to *anyone* that calls "withdrawMoney()"

    function withdrawMoney() public {
        if(lockedUntil < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        }
    }

    // sends to specific address

    function withdrawMoneyTo(address payable _to) public {
        if(lockedUntil < block.timestamp) {
            _to.transfer(getBalance());
        }
    }
}