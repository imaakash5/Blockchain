//SPDX-License-Identifier :MIT
pragma solidity 0.8.19;

import {stdError, Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {MyERC20} from "../src/MyERC2.sol";

contract TestMyERC20 is Test {
    address public user1;
    address public user2;
    address public user3;
    address public user4;
    address public admin;

    MyERC20 public token;

    function setUp() public {
        admin = vm.addr(1999);
        user1 = vm.addr(2);
        user2 = vm.addr(3);
        vm.prank(admin);
        token = new MyERC20();
        address a = 0x83ec1a67b4af74ab3881286401f20d9794ef06f31fb686c282f8f2c4c59f3dc2;
        bytes32 t = keccak256(abi.encodePacked(a));
        console.logBytes32(t);
    }

    function testMint() public {
        vm.prank(admin);
        token.mint(admin, 5000);
        assertEq(token.balanceOf(admin), 5000);
        console.log(admin);
        console.log(user1);
        console.log(user2);
        }

    // function testBurn() public {
    //     vm.startPrank(admin);
    //     token.mint(user1, 2000);
    //     console.log(token.balanceOf(user1));
    //     token.burn(user1, 1000);
    //     vm.stopPrank();
    //     assertEq(token.balanceOf(user1), 1000);
    //     vm.expectRevert("Ownable: caller is not the owner");
    //     token.burn(user1, 500);
    // }
}
