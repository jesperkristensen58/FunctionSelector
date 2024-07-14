# method 1 uses sha3:
from sha3 import keccak_256
# method 2 uses eth-utils:
from eth_utils import function_signature_to_4byte_selector # pip install eth-utils

# See here for the 'browser version': https://emn178.github.io/online-tools/keccak_256.html

def get_function_selector(func_signature):
    """
    Calculate the function selector for a given Solidity function signature.

    :param func_signature: A string of the function signature (e.g., "transfer(address,uint256)")
    :return: The 4-byte function selector as a hexadecimal string
    """
    # method 1:
    return '0x' + keccak_256(func_signature.encode("utf-8")).hexdigest()[:8]

    # method 2:
    # return '0x' + function_signature_to_4byte_selector(func_signature).hex()

# Example usage
signature = "transfer(address,uint256)"
selector = get_function_selector(signature)

print(f"Function: {signature}")
print(f"Selector: {selector}")
