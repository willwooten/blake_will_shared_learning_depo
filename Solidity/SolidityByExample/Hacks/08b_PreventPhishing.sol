// Preventative Techniques

// Use msg.sender instead of tx.origin
// 
//     function transfer(address payable _to, uint _amount) public {
//         require(msg.sender == owner, "Not owner");
// 
//         (bool sent, ) = _to.call.value(_amount)("");
//         require(sent, "Failed to send Ether");
//     }