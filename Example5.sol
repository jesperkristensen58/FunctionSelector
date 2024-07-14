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
        this.foo(); // Calls foo() in 'external mode' and emits the selector for foo(): 0xc2985578
        foo(); // calls foo() in 'internal mode' so it emits the selector for ... bar()!: 0xfebb0f7e
    }
}
