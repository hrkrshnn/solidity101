// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

/// Comments that start with three slashes: NatSpec comments.
/// 
/// A faucet that holds ETH distributes it later.
contract Faucet {
    /// Function that allows the Faucet to receive ETH
    /// Anyone can send eth to the address of the contract.
    /// Notice the keyword payable.
    receive() payable external {
    }

    /// Sends back 0.1 ether to the sender
    function claim() external {
        payable(msg.sender).transfer(0.1 ether);
    }
}
