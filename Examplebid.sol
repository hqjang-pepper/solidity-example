pragma solidity ^0.8.9;

interface IERC721 {
    function transfer(address, uint) external;

    function transferFrom(
        address,
        address,
        uint
    ) external;
}

contract Example{
    event Start();
    event Bid(address indexed sender, uint amount);
    event End(address winner, uint amount);

    IERC721 public nft;
    uint public nftId;
    
    address payable public seller;
    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    
    mapping(address => uint) public bids;
    
    function start() external{
        require(!started, "started");
        require(msg.sender==seller, "not seller");
        nft.transferFrom(msg.sender,address(this),nftId);
        started=true;
        emit Start();
    }
    
    function bid() external payable{
        require(started,"not started");
        require(!ended, "ended");
        require(msg.value>highestBid, "value < highestBid");
        
        if (highestBidder != address(0)) {
            bids[highestBidder] += highestBid;
        }
        
        highestBidder = msg.sender;
        highestBid = msg.value;
        
        emit Bid(msg.sender, msg.value);
    }
    

    function end() external{
        require(started, "not started");
        require(!ended, "already ended");
        ended =true;
        if (highestBidder != address(0)) {
            nft.transfer(highestBidder, nftId);
            seller.transfer(highestBid);
        } else {
            nft.transfer(seller, nftId);
        }
        emit End(highestBidder, highestBid);
    }
    
}
