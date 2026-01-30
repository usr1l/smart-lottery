// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

/**
 * @title Raffle Contract
 * @author Tony
 * @notice Sample Raffle Contract
 * @dev Implements Chainlink VRFv2.5.
 */

contract Raffle {
    // use prefix like Raffe__ to identify custom errors
    error Raffle__SendMoreETHToEnter();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    event RaffleEntered(address indexed player);

    constructor(uint256 _entranceFee) {
        i_entranceFee = _entranceFee;
    }

    function enterRaffle() public payable {
        // require(msg.value >= i_entranceFee, SendMoreETHToEnter());
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreETHToEnter();
        }
        s_players.push(payable(msg.sender));


    }

    function pickWinner() public {}

    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
