//SPDX-License-Identifier:MIT
pragma solidity 0.8.19;

import {stdError, Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {LimitedTokens} from "../src/LimitedTokens.sol";

contract TestLimitedTokens is Test {
    address public admin;
    address public user1;
    address public user2;
    address public user3;
    address public user4;
    LimitedTokens public TestLimitedToken;

    function setUp() public {
        admin = vm.addr(1);
        user1 = vm.addr(2);
        user2 = vm.addr(3);
        user3 = vm.addr(4);
        vm.prank(admin);
        TestLimitedToken = new LimitedTokens();
    }

    function testMint() public {
        vm.startPrank(admin);
        TestLimitedToken.mint(admin, 5);
        console.log(TestLimitedToken.balanceOf(admin));
        vm.expectRevert("Owner can have a 5 tokens only");
        TestLimitedToken.mint(admin, 1);
        TestLimitedToken.mint(user1, 4);
        // console.log(TestLimitedToken.balanceOf(user1));
        vm.expectRevert("Owner can have a 5 tokens only");
         TestLimitedToken.mint(user1, 2);
        // console.log(TestLimitedToken.balanceOf(user1));

        // TestLimitedToken.mint(user1,3);
        //   console.log(TestLimitedToken.balanceOf(user1));
        
    }
}
