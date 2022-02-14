pragma solidity ^0.5.1;


contract ERC20Token{
    string public name;
    mapping(address => uint256) public balances;
    function mint() public {
        balances[tx.origin]++;
    }
}


contract MyContract{
    mapping(address=>uint256) public balances;
    address payable wallet;
    //payable tells us that this wallet can recieve or send tokens
    //we have to explicitly tell wherever something payable is needed

    //events in a smartcontact are a way for users to know when some activity has happened on the smart contract
    // events can be when a token is bought  , price drops , big sale etc.
    event Purchase(
        address indexed buyer,
        uint256 amount
    );


    constructor (address payable MyWallet) public {
        wallet =MyWallet; //this is defining  the wallet to the address of the  owner of the blockchain
    }

    function() external payable{ //this is a fallback function , to handle errors occuring in the functions that are put inside this function.
    //external is a modifier that ensures that this function is only called outside the smart contract and not inside it .
        buytoken();
    }

    function buytoken() public payable{ //will help buy tokens
        balances[msg.sender]+=1; //adding one token to the caller of this public function inside the blockchain
        wallet.transfer(msg.value); //transacting that token to the wallet
        //so when someone buy token , the transaction money will be recieved int he wallet of the owner of the smart contract
        emit Purchase(msg.sender,1);


        


    }
}
