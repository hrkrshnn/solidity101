// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract POWFaucet {
    /// Mapping.
    /// A hash table with key being an address
    /// and a unsigned integer as value.
    /// Notice the keyword public.
    /// Public keyword for state variables automatically
    /// creates a getter function.
    /// Getter function with signature
    /// "function claims(address) view returns (uint);"
    mapping(address => uint) public claims;

    receive() payable external {
    }

    /// Sends back 0.1 ether to the sender, up to 2 times.
    /// Proof of work is required for claiming ether.
    /// Needs to call claim function with a unique integer for
    /// each address, which is obtained by work!
    ///
    /// TODO: the same proof of work can be used both the times.
    /// Implement it in such a way that you will need different
    /// proof of work numbers for each turn.
    /// Hint: nonces.
    function claim(uint pow) external {
        bytes memory data = abi.encodePacked(msg.sender, pow);
        uint256 hash = uint256(keccak256(data));
        // TODO: try to use custom errors instead of strings.
        require(hash % 10 == 0, "Proof of work required");

        // TODO: try to use custom errors instead of strings.
        require(claims[msg.sender] <= 0.2 ether, "You claimed too much");

        claims[msg.sender] += 0.1 ether;

        // TODO: <address payable>.transfer has some issues if
        // the address executes code on ETH transfer or for certain proxy
        // contracts. What is the problem? How do we fix it?
        // What about re-entrancy?
        // Hint: msg.sender.call{value: 0.1 ether)("");
        payable(msg.sender).transfer(0.1 ether);
    }
}
