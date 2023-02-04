pragma solidity 0.8.10;

contract MyContract{
    address public lastSender;

    function receive_to_contract() external payable{
        lastSender = msg.sender;
    }

    function pay_user(address payable addr,uint eth_amount) public payable{
        (bool sent,bytes memory data) = addr.call{value: eth_amount*(10**18)}("");
        require (sent,"Error sending ETH from contract");
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}