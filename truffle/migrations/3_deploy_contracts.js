const EventManagement = artifacts.require("SchoolEvents");

module.exports = function(deployer){
    deployer.deploy(EventManagement);
}