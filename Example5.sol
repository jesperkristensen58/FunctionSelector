pragma solidity 0.8.25; // Specify the version of Solidity to be used

contract MsgSigExample {
    // Event to log the function selector
    event LogSelector(bytes4);

    // Function foo that emits the function selector
    function foo() public {
        emit LogSelector(msg.sig); // Emits the selector for foo(): 0xc2985578
    }

    // Function bar that emits the function selector and calls foo()
    function bar() public {
        emit LogSelector(msg.sig); // Emits the selector for bar(): 0xfebb0f7e
        this.foo(); // Calls foo() and emits the selector for foo(): 0xc2985578
    }
}

contract MsgSigExampleDoesNotChange {
    // Event to log the function selector
    event LogSelector(bytes4);

    // External function that emits the function selector and calls internal functions
    function externalFunction() external {
        emit LogSelector(msg.sig); // Emits the selector for externalFunction(): 0x3a32b549
        internalFunction(); // Calls an internal function, msg.sig does not change
        anotherInternalFunction(); // Calls another internal function, msg.sig still does not change
    }

    // Internal function that emits the function selector
    function internalFunction() internal {
        emit LogSelector(msg.sig); // Still emits the selector for externalFunction(): 0x3a32b549
    }

    // Another internal function that emits the function selector
    function anotherInternalFunction() internal {
        emit LogSelector(msg.sig); // Still emits the selector for externalFunction(): 0x3a32b549
    }
}
