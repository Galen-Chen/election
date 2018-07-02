pragma solidity ^0.4.2;

contract Election {
  
    // model  a  candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    // store accounts that have voted
    mapping(address =>bool) public voters;
    //store candidates
    //fetch candidate

    mapping (uint => Candidate) public candidates;
    //store candidates count   ..becasue we can not know the size of map; so use it to count.
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    //constructor
    constructor () public {   
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0); //add this candidate to number cC in the map
    }

    function vote(uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);
        // require a valid candidate

        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;
        // update candidate vote count
        candidates[_candidateId].voteCount ++;

        // trigge an event
        emit votedEvent(_candidateId);


    }


}