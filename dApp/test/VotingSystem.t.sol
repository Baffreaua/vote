// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import "forge-std/Test.sol";
import "../src/VotingSystem.sol";

contract VotingSystemTest is Test {
    VotingSystem votingSystem;

    function setUp() public {
        string;
        proposalNames[0] = "Proposal 1";
        proposalNames[1] = "Proposal 2";

        votingSystem = new VotingSystem(proposalNames);
    }

    function testInitialProposals() public {
        assertEq(votingSystem.proposals(0).name, "Proposal 1");
        assertEq(votingSystem.proposals(1).name, "Proposal 2");
        assertEq(votingSystem.proposals(0).voteCount, 0);
        assertEq(votingSystem.proposals(1).voteCount, 0);
    }

    function testProposalsCount() public {
        assertEq(votingSystem.proposals.length, 2);
    }
}
