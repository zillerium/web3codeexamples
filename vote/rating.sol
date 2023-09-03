// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }
    
    Project[] projects;

    // TODO: add the findWinner function

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

function findWinner() external view returns (Project memory) {
    uint highestAvg = 0;
    uint highestProject = 0;
    for (uint i = 0; i < projects.length; i++) {
        uint[] storage ratings = projects[i].ratings;
        uint total = 0;
        for (uint j = 0; j < ratings.length; j++) {
            total += ratings[j];
        }
        uint avg = ratings.length > 0 ? total / ratings.length : 0;
        if (avg > highestAvg) {
            highestAvg = avg;
            highestProject = i;
        }
    }
    return projects[highestProject];
}

 

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}

