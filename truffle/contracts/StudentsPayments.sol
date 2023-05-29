pragma solidity ^0.8.0;

contract StudentPayment {
  struct Payment {
    address studentAddress;
    uint256 amount;
    bool isPaid;
    uint256 timestamp;
  }
  
  mapping(uint256 => Payment) public payments;
  uint256 public paymentCount;

  event PaymentMade(uint256 paymentId, address studentAddress, uint256 amount, uint256 timestamp);

  function makePayment(uint256 paymentId) external payable {
    require(!payments[paymentId].isPaid, "Payment has already been made");
    payments[paymentId] = Payment(msg.sender, msg.value, true, block.timestamp);
    emit PaymentMade(paymentId, msg.sender, msg.value, block.timestamp);
  }

  function getPaymentDetails(uint256 paymentId) external view returns (address, uint256, bool, uint256) {
    Payment memory payment = payments[paymentId];
    return (payment.studentAddress, payment.amount, payment.isPaid, payment.timestamp);
  }

  function checkPaymentStatus(uint256 paymentId) external view returns (bool) {
    return payments[paymentId].isPaid;
  }
}
