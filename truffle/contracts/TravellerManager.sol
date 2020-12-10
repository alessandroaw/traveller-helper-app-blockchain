// TRAVELLER MANAGER

pragma solidity ^0.6.0;

import './Ownable.sol';

contract TravellerManager is Ownable{
    uint constant fee = 100;
    
    struct Photo {
        address payable helper;
        bool isApproved;
    }
    
    uint public index;
    uint public balance;
    mapping(uint => Photo) public photos;
    
    event PhotoStatus(uint index, address helper, bool isApproved);
        
    constructor(address _photographer) public onlyOwner {
        transferOwnership(_photographer);
    }
    
    function proposePhoto() public {
        require(getBalance() >= fee, "insufficent balance");
        photos[index] = Photo(msg.sender, false);
        balance -= fee;
        emit PhotoStatus(index, photos[index].helper, photos[index].isApproved);
        index++;
    }
    
    function rejectPhoto() public{
        balance += fee;
    }
    
    function approvePhoto(uint _index) public payable onlyOwner{
        require(!photos[_index].isApproved, "photo already approved");
        photos[_index].isApproved = true;
        address payable to = photos[_index].helper;
        to.transfer(fee);
    }

    // Withdrawing money from contract to photograper account
    function withdrawMoney() public payable onlyOwner {
        address payable to = msg.sender;
        to.transfer(getBalance());
    }

    function getBalance() public view onlyOwner returns(uint) {
        return balance;
    }
    
    receive() external payable {
        balance += msg.value;
    }

}