// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

// import Foo.sol from current directory
import "./35a_Import.sol";

contract Import {
    // Initialize Foo.sol
    Foo public foo = new Foo();

    // Test Foo.sol by getting it's name.
    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}
