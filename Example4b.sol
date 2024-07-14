pragma solidity 0.8.25;

// Define the TargetContract with a public state variable and a function to set its value
contract TargetContract {
    uint256 public value; // Public state variable to store a value

    // Function to set the value of the state variable
    function setValue(uint256 _newValue) public {
        value = _newValue; // Update the value of the state variable
    }
}

// Define an interface for the TargetContract
interface ITargetContract {
    function setValue(uint256 _newValue) external;
}

// Define the CallerContract that will call the setValue function of the TargetContract
contract CallerContract {
    // Function to call setValue on a target contract using the interface
    function callSetValue(address _target, uint256 _newValue) external {
        ITargetContract(_target).setValue(_newValue); // Call setValue using the interface
    }
}
