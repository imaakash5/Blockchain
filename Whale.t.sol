//SPDX-License-Identifier : MIT
import "forge-std/test.sol";
import "forge-std/console.sol";
import "../lib/openzeppelin-contracts/contracts/interfaces/IERC20.sol";

pragma solidity ^0.8.19;

contract Forktest is Test {
    IERC20 public dai;

    function setUp() public {
        dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }

    function testDeposit() public {
        vm.prank(address(123));
        address random = address(123);
        uint256 balBefore = dai.balanceOf(random);
        console.log(balBefore);
        deal(address(dai), random, 1e6 * 1e18, true);
        uint256 balAfter = dai.balanceOf(random);
        console.log(balAfter);
    }
}
