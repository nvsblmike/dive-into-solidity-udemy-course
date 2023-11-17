//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract KnowledgeTest {
    string[] public tokens = ["BTC", "ETH"];
    address[] public players;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function changeTokens() public {
        string[] storage t = tokens;
        t[0] = "VET";
    }

    receive() external payable {

    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function transferAll(address destination) public returns(bool) {
        require(msg.sender == owner, "ONLY_OWNER");
        (bool success, ) = destination.call{value: address(this).balance}("");
        return success;
    }

    function start() public {
        players.push(msg.sender);
    }

    function concatenate(string memory a, string memory b) public pure returns(string memory) {
        bytes memory totalBytes = abi.encodePacked(a, b);

        return string(totalBytes);
    }
}
