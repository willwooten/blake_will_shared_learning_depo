// Enum
// 
// Solidity supports enumerables and they are useful to model choice and keep track of state.
// 
// Enums can be declared ouside of a contract.

// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

// declare enum outside
import "./12b_Enums_Declare.sol";

contract Enum {
    // Enum representing shipping status
    
    // declare enum inside:
    // enum Status {
    //     Pending,
    //     Shipped,
    //     Accepted,
    //     Rejected,
    //     Canceled
    // }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to it's first value, 0
    function reset() public {
        delete status;
    }
}