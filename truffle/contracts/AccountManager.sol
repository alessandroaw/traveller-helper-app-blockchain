// ACCOUNT MANAGER

pragma solidity ^0.6.0;

import './TravellerManager.sol';

contract AccountManager {
    
    uint index;
    mapping(address => TravellerManager) public listedTraveller;
    
    event TravellerListing(
        address listedTraveller,
        address travellerManager
    );
    
    event Logging(string message);
    
    function enlistTraveller(address _traveller) public {
        listedTraveller[_traveller] = new TravellerManager(_traveller);
        index++;
        emit TravellerListing(_traveller, address(listedTraveller[_traveller]));
    }
    
    function getTraveller(address _traveller) public view returns(address) {
        return address(listedTraveller[_traveller]);
    }
}