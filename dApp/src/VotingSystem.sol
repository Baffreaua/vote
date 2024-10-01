// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

contract VotingSystem {
    struct Proposal {
        string name;
        uint256 voteCount;
    }

    struct Voter {
        bool voted;
        uint256 id;
    }

    Proposal[] public proposals;
    mapping(address => Voter) public voters;

    constructor(string[] memory proposalNames) {
        for (uint256 x = 0; x < proposalNames.length; x++) {
            proposals.push(Proposal({
                name: proposalNames[x],
                voteCount: 0
            }));
        }
    }

    function vote(uint256 proposalId) public {
        require(!voters[msg.sender].voted, "You have already voted.");
        require(proposalId < proposals.length, "Invalid proposal ID.");

        voters[msg.sender].voted = true;
        voters[msg.sender].id = proposalId;
        proposals[proposalId].voteCount++;
    }

    function winningProposal() public view returns (uint256 winningProposalId) {
        uint256 winningVoteCount = 0;
        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVoteCount) {
                winningVoteCount = proposals[i].voteCount;
                winningProposalId = i;
            }
        }
    }
}
