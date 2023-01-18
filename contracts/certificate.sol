pragma solidity >=0.4.25 <0.9.0;
pragma experimental ABIEncoderV2;

import "./user.sol";

contract Certificate {
    uint256 id;
    string private name;
    bool private verified;
    uint256 private date;
    string private link;

    constructor(uint256 id_,string memory _name, uint256 date_, string memory link_) {
        id = id_;
        name = _name;
        date = date_;
        verified = false;
        link = link_;
    }
    
}

