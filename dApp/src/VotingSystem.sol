// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract VotingSystem {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    Proposal[] public proposals;

    constructor(string[] memory proposalNames) {
        for (uint256 i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }
}
