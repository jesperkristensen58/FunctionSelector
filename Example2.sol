pragma solidity 0.8.25;

/*
This example shows how to compute the function selector for any given function signature using the Keccak-256 hashing algorithm.
The computeSelector function accepts a function signature as a string, converts it to bytes, hashes it using Keccak-256, and returns the firs
 four bytes of the hash, which is the function selector.
 
 We also verify the correctness of these computed selectors through the testSelectors function.
 This function asserts that the computed selectors for foo() and bar(uint256) match their expected values
 (0xc2985578 and 0x0423a132, respectively). By doing so, it demonstrates the practical application of function selectors and provides
 a reliable method for developers to validate their computations.

 BTW: Alternative way to compute the keccak256 hash in your browser: https://emn178.github.io/online-tools/keccak_256.html
*/
contract FunctionSignatureTest {
    function computeSelector(string memory _functionSignature) public pure returns (bytes4) {
        return bytes4(keccak256(bytes(_functionSignature)));
    }

    function testSelectors() external pure returns (bool) {
        assert(computeSelector("foo()") == 0xc2985578);
        assert(computeSelector("bar(uint256)") == 0x0423a132);
        return true;
    }
}
