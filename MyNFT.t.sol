//SPDX-License-Identifier - MIT;
pragma solidity 0.8.19;

import {Test, stdError} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {MyNFT} from "../src/MyNFT.sol";

contract TestMyNFT is Test {
    address public user1;
    address public user2;
    address public user3;
    address public user4;
    address public admin;

    MyNFT public TestMyNFT;

    function setUp() public {
        admin = vm.addr(1543245);
        user1 = vm.addr(265453);
        user2 = vm.addr(35345);
        vm.prank(admin);
        TestMyNFT = new MyNFT();
    }

    function testBurn() public {
        vm.startPrank(admin);
        TestMyNFT.mint(user1, 4);
        console.log(TestMyNFT.ownerOf(1));
        TestMyNFT.burn(2);
        vm.stopPrank();
        assertEq(TestMyNFT.balanceOf(user1), 3);
    }

    function testUnPause() public {
        vm.startPrank(admin);
        TestMyNFT.mint(user2, 4);
        vm.stopPrank();
        vm.expectRevert("Pausable: not paused");
        vm.prank(admin);
        TestMyNFT.unpause();
    }

    function testPause() public {
        vm.startPrank(admin);
        TestMyNFT.mint(user1, 5);
        TestMyNFT.pause();
        vm.expectRevert("Pausable: paused");
        TestMyNFT.pause();
        vm.stopPrank();
    }

    function testsetBaseURI() public {
        TestMyNFT.setbaseURI_("https://codebeautify.org/random-link-generator");
        assertEq(TestMyNFT.baseURI_(), "https://codebeautify.org/random-link-generator");
    }

    function testNotRevealedURI() public {
        vm.prank(admin);
        TestMyNFT.notRevealedURI_("http://sample.edu/");
        assertEq(TestMyNFT.notRevealedURI(), "http://sample.edu/");
    }

    function testTokenURI() public {
        vm.startPrank(admin);
        TestMyNFT.mint(user1, 2);
        TestMyNFT.setRevealed();
        vm.stopPrank();
        TestMyNFT.setbaseURI_("https://codebeautify.org/random-link-generator");
        TestMyNFT.tokenURI(1);
        console.log(TestMyNFT.tokenURI(1));
        assertEq(TestMyNFT.tokenURI(1), "https://codebeautify.org/random-link-generator1.json");
    }
}
