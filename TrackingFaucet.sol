// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract TrackingFaucet {
    mapping(address => uint) claims;
    /// Function that allows us to receive ETH
    receive() payable external {
    }

    /// Sends back 0.1 ether to the sender
    function claim() external {
        // Note: in real code try to use custom errors
        // instead of revert strings
        require(
            claims[msg.sender] <= 0.2 ether,
            "You claimed too much."
        );
        claims[msg.sender] += 0.1 ether;
        payable(msg.sender).transfer(0.1 ether);
    }
}
