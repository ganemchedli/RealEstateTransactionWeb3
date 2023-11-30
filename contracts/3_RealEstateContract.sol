// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract RealEstateContract {
    address public owner;
    address public buyer;
    string public propertyDetails;
    bool public isTransactionComplete;

    event TransactionCompleted();

    constructor(string memory _propertyDetails) {
        owner = msg.sender;
        propertyDetails = _propertyDetails;
        isTransactionComplete = false;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can call this function");
        _;
    }

    function initiateTransaction(address _buyer) external onlyOwner {
        buyer = _buyer;
    }

    function completeTransaction() external onlyBuyer {
        isTransactionComplete = true;
        emit TransactionCompleted();
    }
}
