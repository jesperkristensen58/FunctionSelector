object "FunctionSelectorExample" {
    code {
        // Deploy the contract
        // Copy the runtime code to memory starting at position 0
        datacopy(0, dataoffset("Runtime"), datasize("Runtime"))
        // Return the runtime code to be executed
        return(0, datasize("Runtime"))
    }

    object "Runtime" {
        code {
            // Function selector logic
            switch getSelector()
            // Case for function selector of "get()"
            case 0x6d4ce63c /* "get()" */ {
                // Load the value from storage at position 0 into memory at position 0
                mstore(0, sload(0))
                // Return the value from memory at position 0 with length 32 bytes
                return(0, 32)
            }
            // Case for function selector of "increment()"
            case 0x371303c0 /* "increment()" */ {
                // Load the value from storage at position 0, increment it by 1, and store it back
                sstore(0, add(sload(0), 1))
                // Stop execution
                stop()
            }
            // Case for function selector of "decrement()"
            case 0xb3bcfa82 /* "decrement()" */ {
                // Load the value from storage at position 0, decrement it by 1, and store it back
                sstore(0, sub(sload(0), 1))
                // Stop execution
                stop()
            }
            // Default case if no function selector matches
            default {
                // Revert the transaction with no data
                revert(0, 0)
            }

            // Helper function to get the function selector from the calldata
            function getSelector() -> selector {
                // Load the first 32 bytes of calldata and right-shift to get the first 4 bytes (function selector)
                selector := div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
            }
        }
    }
}
