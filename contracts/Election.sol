pragma solidity 0.5.12;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string _name;
        uint voteCount;
    }
    string public candidate;

    // Store accounts that have voted
    mapping(address => bool) public voters;
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
	function vote (uint _candidateId) public {
		//require that they haven't voted before
		require(!voters[msg.sender]);

		//require a valid candidate
		require(_candidateId > 0 && _candidateId <= candidatesCount);

		//record that the voter has voted
		voters[msg.sender] = true;

		//update candidate vote count
		candidates[_candidateId].voteCount ++;

		//trigger voted event
		emit votedEvent(_candidateId);
	}
}
