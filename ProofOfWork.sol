// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

/// A contract for finding the proof of work number
/// Note: this does not really have to be done using a contract, or on chain.
contract ProofOfWork {
    /// Returns unsigned integer that can be used to claim eth from the faucet.
    function pow() external view returns (uint) {
        // Assuming that keccak256 is uniformly distributed,
        // it takes around 10 tries for "keccak256(random_number) % 10 == 0"
        // to be true.
        // We do this in a for loop.
        for (uint i = 0; i < 15; i++) {
            bytes memory data = abi.encodePacked(msg.sender, i);
            uint256 hash = uint256(keccak256(data));
            if (hash % 10 == 0)
                return i;
        }
        revert("Could not find a hash");
    }
}
