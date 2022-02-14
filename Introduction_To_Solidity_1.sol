pragma solidity ^0.5.1; //defining to use a version of solidity above 0.4.24;

contract MyContract{ //starting of my contract which will be stored on the  blockchain
    // if we put "public" while declaring a state variable , it will automatically help us GET the value of that state variable.
    //and we would not need the get() fn. 
    //in this code i have used the get() fn as well because i wanted to see how it works 
    // if we add the "constant" keyword while declaring the variable , then we cannot change its value using the set() fn.
    string public val="myValue"; //this is like a global variable which will be stored on the blockchain

    constructor() public{ // this is a public constructorwhere we have set the default value for the stringvariable called val;
    //make sure your code has only one constructor
        val="myValue";
    }

    //public keyword means the the respective function/or whatever  we put  this keyword with , 
    //will be accessible to anyone who has access to my smart contract on the blockchain 
    //and not just this smart contract

    //memory will help store the value of the variables that we are accessing through the function on the blockchain(i believe)
    //this feature has been brought on from version 0.5 of solidity

    function get() public view returns(string memory){ //this is a public function named 'get' , it is public, it is only used to view some value, and it returns a string value
        return val;
    }

    function set(string memory x ) public{ //this function is used to set a value to a variable. it is public , but does not view or return anything.
        val=x;
    }

    //following is how you declare variables using solidity
    string public mystr="string 1";
    bool public mybool=true;
    int public myint=-1;
    uint public myuint=12; //uints are unsigned integers (without the minus signs)
    uint8 public myuint8=8; //(research more about this and then update this comment)
    uint256 public myuint256=99999;
    //address is a datatype which is like the  account of a blockchain user
    address owneer;

    //enum is a numerated list which is gonna allow us to keep a set list of things in our contract
    enum State {Waiting,Ready,Active}  //enumerated list of these 3 values
    State public state; //creating a variable that can hold values from the enum called State.

    //constructor() public{ //what values will state variable hold as a default 
     //   state=State.Waiting; //Waiting value from State is selected
   // }

    function activate() public{ //fn to change the value of the state variable
        state=State.Active;
    }

    function isActive() public view returns(bool){ //fn to check if state is Active or not 
        return state==State.Active;
    }
    
    //arrays in solidity
    //it is not possible to know the size of an array in solidity;
    // we can use a variable to keep track of the items in an array 
    // we can declare an array using the following command :-
    // int[] public myintegerarray;
    
    //Data  structures in solidity
    // we can declare custom data structures in solidity using the "struct" keyword

    Person[] public people; //array that can hold  values of Person class type . class is defined below

    uint256 public peoplecount=0; //will tell us the number of items in the people array

    struct Person { //class person
        string firstname;
        string lastname;
    }

    function addPerson(string memory frstname, string memory lstname) public {
        people.push(Person(frstname,lstname)); //arrayname.push() is used  to push data into the array
        peoplecount+=1;
    }

    //mappings in solidity are key-value pairs that help us in storing values which are also associated to a key and thus are easier to lookup
    mapping(uint => Person1) public people1;
    uint256 peoplecount1=0;

    address owner;

    constructor() public {
        owner=msg.sender;
        //when the code is run and  this constructor gets executed , the msg.sender is the owner of the smartcontact and this constructor will set that variable
    }

    //to get the timestamp of the most current block in solidity we can do "block.timestamp";

    modifier onlyOwner(){ //modifier that will add an extra condition to the function that it  is applied to 
    //this modifier will check and see whoever is calling the function is actually the owner of the smart contract
    //msg.sender is an inbuilt  feature in solidity which will see the address of the caller of the function wherever this modifier is applied to
        require(msg.sender==owner);
        //require is basically try and catch of solidity
    }

    struct Person1{
        uint id;
        string firstname1;
        string lastname1;
    }

    function addPerson1 (string memory frstname1, string memory lstname1) public onlyOwner{
        incrementpeoplecount1();
        people1[peoplecount1]=Person1(peoplecount1,frstname1,lstname1);
    }

    // "internal" is the opposite of "public". it is used when we have to declare something that will be used by the smart contract only 
    //use of internal will make sure that whatever it  is used with is not exposed to the blockchain user and is only used by the smart contract itself for its own purposes

    function incrementpeoplecount1() internal{
        peoplecount1+=1;
    }








}
