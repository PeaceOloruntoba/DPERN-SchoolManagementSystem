const AcademicRecords = artifacts.require("AcademicRecords");

module.exports = function(deployer){
    deployer.deploy(AcademicRecords);
};
