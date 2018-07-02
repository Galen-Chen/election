pragma solidity ^0.4.2;

contract Election {
  
    // model  a  candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store candidates
    //fetch candidate

    mapping (uint => Candidate) public candidates;
    //store candidates count   ..becasue we can not know the size of map; so use it to count.
    uint public candidatesCount;

    //constructor
    function Election () public {   
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name,0); //add this candidate to number cC in the map
    }


}