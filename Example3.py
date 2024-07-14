# also run: pip install eth-utils
from eth_utils import function_signature_to_4byte_selector

def get_function_selector(func_signature):
    """
    Calculate the function selector for a given Solidity function signature.

    :param func_signature: A string of the function signature (e.g., "transfer(address,uint256)")
    :return: The 4-byte function selector as a hexadecimal string
    """
    return '0x' + function_signature_to_4byte_selector(func_signature).hex()

# Example usage
signature = "transfer(address,uint256)"
selector = get_function_selector(signature)

print(f"Function: {signature}")
print(f"Selector: {selector}")
