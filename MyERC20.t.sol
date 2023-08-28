            // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {MyERC20} from "../src/MyERC20.sol";

contract ERC20Test is Test {
    MyERC20 public token;

    address public admin = vm.addr(1);
    address public user1 = vm.addr(2);
    address public user2 = vm.addr(3);
    address public user3 = vm.addr(4);

    function setUp() public {
        vm.prank(admin);
        token = new MyERC20();
    }

    function testName() public {
       // vm.expectRevert(bytes("wrong contract name"));
       
     assertEq(token.name(), "AAKASH", "Token name is set correctly");
        
       
    }
    //function test owner

    function testOwner() public {
      //vm.expectRevert("Ownable : caller is not the owner");
        assertEq(token.owner(), admin);
    }

    function testTokenMint() public {
        //deal(address(token), admin, 100, true);
        vm.startPrank(admin); // start Prank sets the caller as admin
        token.mint(admin, 1000 * token.decimals()); // else the caller was random
        assertEq(token.balanceOf(admin), 1000 * token.decimals(), "balanceOf returns the correct amount");
        vm.stopPrank();
        console.log(token.balanceOf(admin));
    }

    function testTokenMintNegative() public{
        vm.startPrank(admin);
        vm.expectRevert("ERC20: mint to the zero address");
        token.mint(address(0), 5000);
    }
    

    function testTokenTransfer() public {
        vm.startPrank(admin);
        token.mint(user1, 500 * token.decimals());
        token.mint(admin, 1000 * token.decimals());
        console.log(token.balanceOf(admin));
        console.log(token.balanceOf(user1));
        vm.stopPrank();
        //vm.prank(admin);
        vm.expectRevert("ERC20: transfer amount exceeds balance");
        token.transfer(user1, 12000);
        assertEq(token.balanceOf(user1), 9000);
    }


    function testTokenTransferFrom() public {
        vm.startPrank(admin);
        token.mint(user2, 18000);
        token.mint(user3, 36000);
        vm.stopPrank();
        vm.startPrank(user3);
        token.approve(user3, 9000);
        console.log(token.allowance(admin, user3));
        vm.expectRevert("ERC20: insufficient allowance");
        token.transferFrom(user3, user2, 40000);
        assertEq(token.balanceOf(user2), 18000);
        console.log(token.owner());
        console.log(address(this));
    }

    function testBurn() public {
        vm.startPrank(admin);
        token.mint(admin, 9000);
        vm.stopPrank();
        vm.expectRevert("Ownable: caller is not the owner");
        token.burn(admin, 500);
        assertEq(token.balanceOf(admin), 9000);
    }

    function testIncreaseAllowance() public {
        vm.startPrank(admin);
        token.mint(user2, 6000);
        token.mint(user3, 6000);
        vm.stopPrank();
        vm.startPrank(user2);
        token.approve(user3, 2000);
        vm.stopPrank();
        vm.prank(user3);
        token.transferFrom(user2, user3, 2000);
        console.log(token.allowance(user2, user3));
        vm.prank(user2);
        token.increaseAllowance(user3, 3000);
        assertEq(token.allowance(user2, user3), 3000);
    }

    function testDecreaseAllowance() public {
        vm.startPrank(admin);
        token.mint(admin, 1000);
        token.mint(user1, 3000);
        vm.stopPrank();
        vm.startPrank(admin);
        token.approve(user1, 3000);
        vm.stopPrank();
        vm.prank(user1);
        token.transferFrom(admin, user1, 1000);
        vm.prank(admin);
        vm.expectRevert();
        token.decreaseAllowance(user1, 2001);
        assertEq(token.allowance(admin, user1), 2000);
    }
}
