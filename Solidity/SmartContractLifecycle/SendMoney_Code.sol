pragma solidity ^0.8.1;

contract SendMoneyExample {
    
    uint public balancedReceived;
    
    function receiveMoney() public payable {
        
        balancedReceived += msg.value;
    }   

    function getBalance() public view returns(uint) {
        
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        
       address payable _to = msg.sender;
       _to.transfer(this.getBalance());
    }
    
    function withrdrawMoneyTo(address payable _to) public {
        
        _to.transfer(this.getBalance());
    }
        
}