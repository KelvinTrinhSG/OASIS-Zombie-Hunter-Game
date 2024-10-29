// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@oasisprotocol/sapphire-contracts/contracts/Sapphire.sol";

contract UserData {
    // Mapping from wallet address to password
    mapping(address => string) private userPass;

    // Mapping from wallet address to gold amount
    mapping(address => uint256) private userGold;

    // Function to update the user's password
    function updatePass(string memory _pass) public {
        userPass[msg.sender] = _pass;
    }

    // Function to update the user's gold amount
    function updateGold(uint256 _gold) public {
        userGold[msg.sender] = _gold;
    }

    // Function to retrieve the user's password
    function getPass(address _user) public view returns (string memory) {
        return userPass[_user];
    }

    // Function to retrieve the user's gold amount
    function getGold(address _user) public view returns (uint256) {
        return userGold[_user];
    }

    // Function to generate a random number between 1 and 10
    function generateNumber() public view returns (uint) {
        // Generate random bytes and convert to uint256
        uint randomNumber = uint(bytes32(Sapphire.randomBytes(32, "")));

        // Use modulus to restrict the number to the range 1 to 10
        // Adding 1 to shift the range from [0, 9] to [1, 10]
        uint matchedNumber = (randomNumber % 10) + 1;

        return matchedNumber;
    }
}