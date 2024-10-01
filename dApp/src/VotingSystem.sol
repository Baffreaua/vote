// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract VotingSystem {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        for (uint256 x = 0; x < proposalNames.length; x++) {
            proposals.push(Proposal({
                name: proposalNames[x],
                voteCount: 0
            }));
        }
    }
}
