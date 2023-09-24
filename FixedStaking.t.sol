// //SPDX - License Idetifier :MIT

// pragma solidity 0.8.15;

// import "@openzeppelin/contracts/access/Ownable.sol";
// import {Test, console} from "forge-std/Test.sol";
// import {stdError} from "forge-std/StdError.sol";
// import {FixedStaking} from "../src/FixedStaking.sol";

// contract Teststaking is FixedStaking, Test {
//     FixedStaking public token;
//     uint256 public startA;

//     address public user1 = vm.addr(2);
//     address public user2 = vm.addr(3);
//     address public user3 = vm.addr(4);
//     address public user4 = vm.addr(5);
//     address public admin = vm.addr(1);

//     function setUp() public {
//         vm.prank(admin);
//         token = new FixedStaking();
//     }

//     function testMint() public {
//         vm.prank(admin);
//         token.mint(admin, 100);

//         assertEq(token.balanceOf(admin), 100);
//     }

//     function testStakeTokens() public {
//         vm.startPrank(admin);

//         console.log(admin);
//         token.mint(admin, 10);
//         token.transfer(user1, 10);
//         vm.stopPrank();

//         vm.startPrank(user1);
//         //vm.expectRevert("caller has not enough tokens to stake");
//         token.stakeTokens(user1, 4);
//         console.log(token.staked(user1), token.balanceOf(user1));
//         vm.stopPrank();
//         }
//     function testTransfer() public{
//         vm.startPrank(admin);
//         token.mint(admin,10);
//         token.transfer(user2);
//         vm.stopPrank();
//         assertEq(token.balanceOf(user2),10);
//     }
//         function testunstake()public{
//             vm.startPrank(admin);
//             token.mint(user1,10);
//             token.mint(user2,5);
//             vm.stopPrank();
//             vm.startPrank(user1);
//             token.stakeTokens(user2,4);
//             vm.stopPrank();
//             console.log(token.balanceOf(user2));
//             vm.startPrank(user1);
//             token.unstake(user2,3);
//             assertEq(token.staked(user1),1);
//         }

//         function testClaim()public{

//             startA=block.timestamp;
//             vm.startPrank(admin);
//             token.mint(user1,10);
//             token.mint(user2,10);
//             vm.stopPrank();
//             vm.startPrank(user1);
//             vm.warp(block.timestamp + 1000 days);
//             //staking the tokens first time
//             token.stakeTokens(user2,4);
//             //vm.warp(block.timestamp+ 3000 da);
//             //expecting 0 staked seconds
//             //console.log(token.stakedseconds());
//             //staking the token again on the same caller
//             skip(2600);
//             token.stakeTokens(user2,2);
//             //claim gets called
//             //stakedseconds should be calculated
//             //console.log(token.stakedseconds());
//             console.log(token.rewards());
//             assertEq(token.rewardsPerHour(),);
//            console.log(block.timestamp);

//         }

//         }
