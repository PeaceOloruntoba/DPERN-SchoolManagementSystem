const PerformanceTracker = artifacts.require("PerformanceTracker");

module.exports = function(deployer){
    deployer.deploy(PerformanceTracker);
}