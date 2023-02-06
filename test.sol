pragma solidity 0.8.10;

contract MyBank{
    mapping(address => uint) private balances;
    // balances stores balances for each adress in a map

    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }
    // deposit , deposits whatever value was sent in the transaction to the senders adress

    function withdraw(address payable recepient,uint amount) public payable{
        amount *= 10**18; // wei to eth
        require(balances[msg.sender]*(10**18) >= amount,"Insufficient Funds");
        (bool sent,bytes memory data) = recepient.call{value:amount}("");
        require(sent,"Withdrawal Failed");
        balances[msg.sender] -= amount;
    }

    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    // withdraw , withdraws money to the specified address given from the balance of the
    // user making the request
}