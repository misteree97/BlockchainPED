pragma solidity 0.5.12;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string _name;
        uint voteCount;
    }
    string public candidate;

    // Read/write candidates
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;

    constructor() public {
		addCandidate("Candidate 1");
		addCandidate("Candidate 2");
	}

	function addCandidate (string memory _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}
}
