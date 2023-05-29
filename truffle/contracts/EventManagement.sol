// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolEvents {
    struct Event {
        string name;
        uint256 date;
        string location;
        uint256 totalDonations;
        uint256 feedbackCount;
    }

    mapping(uint256 => Event) public events;

    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addEvent(
        uint256 eventId,
        string memory name,
        uint256 date,
        string memory location
    ) public onlyAdmin {
        events[eventId] = Event(name, date, location, 0, 0);
    }

    function makeDonation(uint256 eventId) public payable {
        Event storage eventObj = events[eventId];
        require(bytes(eventObj.name).length > 0, "Event does not exist");

        eventObj.totalDonations += msg.value;
    }

    function submitFeedback(uint256 eventId) public {
        Event storage eventObj = events[eventId];
        require(bytes(eventObj.name).length > 0, "Event does not exist");

        eventObj.feedbackCount++;
    }

    function getEvent(uint256 eventId)
        public
        view
        returns (
            string memory name,
            uint256 date,
            string memory location,
            uint256 totalDonations,
            uint256 feedbackCount
        )
    {
        Event storage eventObj = events[eventId];
        require(bytes(eventObj.name).length > 0, "Event does not exist");

        return (
            eventObj.name,
            eventObj.date,
            eventObj.location,
            eventObj.totalDonations,
            eventObj.feedbackCount
        );
    }
}
