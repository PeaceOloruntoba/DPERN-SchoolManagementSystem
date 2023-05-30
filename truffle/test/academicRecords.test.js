const AcademicRecords = artifacts.require('AcademicRecords');

const contractInstance = await AcademicRecords.deployed();
const studentId = 123;
const courseId = 456;
const expectedGrade = 90;

// Test adding a grade
await contractInstance.addGrade(studentId, courseId, expectedGrade);
const actualGrade = await contractInstance.getGrade(studentId, courseId);
assert.equal(actualGrade, expectedGrade, 'The grade was not added correctly');
