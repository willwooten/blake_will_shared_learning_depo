// Here is a contract to test sending transactions from the multi-sig wallet

// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

contract TestContract {
    uint public i;

    function callMe(uint j) public {
        i += j;
    }

    function getData() public pure returns (bytes memory) {
        return abi.encodeWithSignature("callMe(uint256)", 123);
    }
}