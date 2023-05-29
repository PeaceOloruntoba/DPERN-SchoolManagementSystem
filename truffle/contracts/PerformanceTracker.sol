// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PerformanceTracker {
    struct Performance {
        uint256 studentId;
        uint256 performanceData;
        bool warningIssued;
    }

    mapping(uint256 => Performance) private performanceRecords;

    event PerformanceAdded(uint256 indexed studentId, uint256 performanceData);
    event WarningIssued(uint256 indexed studentId);

    function addPerformance(uint256 _studentId, uint256 _performanceData) public {
        bool isNewPerformance = (performanceRecords[_studentId].studentId == 0);
        performanceRecords[_studentId] = Performance(_studentId, _performanceData, false);

        if (isNewPerformance) {
            emit PerformanceAdded(_studentId, _performanceData);
        } else {
            checkPerformance(_studentId);
        }
    }
    function checkPerformance(uint256 _studentId) private {
        uint256 performanceData = performanceRecords[_studentId].performanceData;

        if (performanceData < 30 && !performanceRecords[_studentId].warningIssued) {
            performanceRecords[_studentId].warningIssued = true;
            emit WarningIssued(_studentId);
        }
    }
    function getPerformance(uint256 _studentId) public view returns (uint256, bool) {
        Performance memory performance = performanceRecords[_studentId];
        return (performance.performanceData, performance.warningIssued);
    }
}
