pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

contract Account {
    struct User {
        address Address;
        string firstName;
        string lastName;
        string phone;
        string email;
    }

    struct Certificate {
        uint256 id;
        string name;
        uint256 date;
        bool verified;
        string link;
    }

    mapping(address => User) public users;
    mapping(address => bool) public usersCheck;
    uint public profilescount ;
    mapping(address => Certificate[]) public userCertificates;
    User[] allUsers;
    function addUser (string memory firstName, string memory lastName, string memory phone, string memory email) {
        require (!usersCheck[msg.sender]); 
        User memory u = User(msg.sender, firstName, lastName, phone, email);
        users[msg.sender] = u;
        usersCheck[msg.sender] = true;
        profilescount ++;
        allUsers.push(u);
    }
    function addCertificate(string memory _name, uint256 _date, string memory link_) public{
        Certificate memory cert = Certificate(block.timestamp, _name, _date, false, link_);
        userCertificates[msg.sender].push(cert);
    }
    function getUserName() public view returns(string memory){
        return users[msg.sender].firstName;
    }
    function getUser(address address_) public view returns(User memory){
        return users[address_];
    }
    function getUserCertificates(address userAddress) public view returns(Certificate [] memory) {
        return userCertificates[userAddress];
    }
    function verifyCertificate(address userAddress, uint256 _id, string link_) public {
        for(uint256 i = 0; i < userCertificates[userAddress].length; i++) {
            if (userCertificates[userAddress][i].id == _id) {
                userCertificates[userAddress][i].verified = true;
            }
        }
    }
    function getUsers() public view returns(User[] memory) {
        return allUsers;
    }
}

