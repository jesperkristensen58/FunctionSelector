pragma solidity 0.8.25; // Specify the version of Solidity to be used

// Define the TargetContract with a public state variable and a function to set its value
contract TargetContract {
    uint256 public value; // Public state variable to store a value

    // Function to set the value of the state variable
    function setValue(uint256 _newValue) public {
        value = _newValue; // Update the value of the state variable
    }
}

// Define the CallerContract that will call the setValue function of the TargetContract
contract CallerContract {
    // Function to call setValue on a target contract
    function callSetValue(address _target, uint256 _newValue) external {
        // Compute the function selector for setValue(uint256)
        bytes4 selector = bytes4(keccak256("setValue(uint256)"));
        
        // Use low-level call to invoke setValue on the target contract
        (bool success, ) = _target.call(abi.encodeWithSelector(selector, _newValue));
        
        // Ensure the call was successful
        require(success, "Call failed");
    }
}
