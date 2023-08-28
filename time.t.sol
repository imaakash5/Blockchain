//SPDX License Identifier:MIT

pragma solidity 0.8.21;

import "forge-std/console.sol";
import {Auction} from "src/time.sol";
import "forge-std/Test.sol";

contract testAuction is Auction, Test {
    Auction public testAuction;
    uint256 private startA;
    uint256 private endA;

    function setUp() public {
        testAuction = new Auction();
        startA = block.timestamp;
        endA = block.timestamp;
    }

    // function testAuctionBeforeStartTime()public
    // {
    //     vm.expectRevert(bytes("cannot bid"));
    //     testAuction.bid();
    //     console.log(testAuction.startAt());
    //     console.log(block.timestamp);
    // }
    // function  testBid()public {
    //     vm.warp(startA+ 1 days);
    //     console.log(startA + 1 days);
    //     testAuction.bid();
    // }

    // function testbidBeforeEndtime() public{
    //     vm.warp(endA + 1 days);
    //     console.log(endA + 1 days);
    //     testAuction.bid();
    // }

    // function testEnd() public{
    //     vm.warp(endA + 3 days );
    //     testAuction.end();
    // }

    //skip
    //rewind
    //roll

    function testcheckSkip() public {
        uint256 t = block.timestamp;
        console.log(t);
        console.log(block.timestamp);
        skip(100);
        assertEq(block.timestamp, t + 100);
        rewind(20);
        console.log(block.timestamp);
        assertEq(block.timestamp, t + 100 - 20);
    }

    function testBlockNumber() public {
        vm.roll(19823);
        assertEq(block.number, 19823);
    }
}
