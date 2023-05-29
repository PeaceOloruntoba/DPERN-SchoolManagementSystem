const StudentPayments = artifacts.require("StudentPayment");

module.exports = function(deployer){
    deployer.deploy(StudentPayments);
}