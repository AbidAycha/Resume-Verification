pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

//import "./Types.sol";

contract User {
    address private Address;
    string private firstName;
    string private lastName;
    string private phone;
    string private email;

    constructor(address address_, string memory firstName_, string memory lastName_, string memory phone_, string memory email_) {
        Address = address_;
        firstName = firstName_;
        lastName = lastName_;
        phone = phone_;
        email = email_;
    }

    function getData() public view returns(string memory){
        return firstName;
    }
    
}

