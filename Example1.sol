pragma solidity 0.8.25;
/*
In Ethereum, function selectors are used to identify which function to call in a contract.

A (function) selector is the first four bytes of the Keccak-256 hash of the function signature (e.g., foo() or bar(uint256)).

Purpose of this Example:
This example demonstrates how to retrieve and use these function selectors within a contract.
It includes simple functions (foo and bar) and corresponding functions (getSelectorOfFoo and getSelectorOfBar) to return their selectors.
*/
contract SelectorExample {
    function foo() public {}

    function getSelectorOfFoo() external pure returns (bytes4) {
        return this.foo.selector; // Returns 0xc2985578
    }

    function bar(uint256 x) public {}

    function getSelectorOfBar() external pure returns (bytes4) {
        return this.bar.selector; // Returns 0x0423a132
    }
}
