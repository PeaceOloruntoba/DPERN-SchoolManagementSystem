// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AcademicRecords {
    address public admin;

    struct Student {
        uint256 studentId;
        string name;
        address studentAddress;
        uint256[] enrolledCourses;
        mapping(uint256 => uint256) grades;
        mapping(uint256 => bool) completedCourses;
        uint256 performance;
    }
    struct Course {
        uint256 courseId;
        string name;
        address lecturer;
    }
    struct Lecturer {
        address lecturerAddress;
        string name;
    }

    mapping(address => Student) public students;
    mapping(uint256 => Course) public courses;
    mapping(address => Lecturer) public lecturers;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addStudent(address studentAddress, uint256 studentId, string memory name) public onlyAdmin {
        students[studentAddress].studentId = studentId;
        students[studentAddress].name = name;
        students[studentAddress].studentAddress = studentAddress;
    }
    function addCourse(uint256 courseId, string memory name, address lecturer) public onlyAdmin {
        courses[courseId] = Course(courseId, name, lecturer);
    }
    function addLecturer(address lecturerAddress, string memory name) public onlyAdmin {
        lecturers[lecturerAddress] = Lecturer(lecturerAddress, name);
    }
    function addGrade(uint256 studentId, uint256 courseId, uint256 grade) public {
        require(msg.sender == admin || msg.sender == lecturers[courses[courseId].lecturer].lecturerAddress, "Only admin or lecturer of the course can add grade");
        students[msg.sender].grades[courseId] = grade;
    }
    function getGrade(uint256 studentId, uint256 courseId) public view returns (uint256) {
        if (msg.sender == admin || msg.sender == lecturers[courses[courseId].lecturer].lecturerAddress) {
            return students[msg.sender].grades[courseId];
        } else {
            revert("Unauthorized access to grade");
        }
    }
    function lecturerOfCourse(uint256 courseId) private view returns (address) {
        return courses[courseId].lecturer;
    }
    function completeCourse(uint256 studentId, uint256 courseId) public {
        require(msg.sender == admin || msg.sender == lecturers[courses[courseId].lecturer].lecturerAddress, "Only admin or lecturer of the course can mark course completion");
        students[msg.sender].completedCourses[courseId] = true;
    }
    function hasCompletedCourse(uint256 studentId, uint256 courseId) public view returns (bool) {
        address studentAddress = students[msg.sender].studentAddress;
        if (msg.sender == admin || msg.sender == studentAddress) {
            return students[studentAddress].completedCourses[courseId];
        } else {
            revert("Unauthorized access to course completion status");
        }
    }
    function getEnrolledCourses(uint256 studentId) public view returns (uint256[] memory) {
        if (msg.sender == admin || msg.sender == students[msg.sender].studentAddress) {
            return students[msg.sender].enrolledCourses;
        } else {
            revert("Unauthorized access to enrolled courses");
        }
    }
}
