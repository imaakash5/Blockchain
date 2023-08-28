//SPDX-License-Identifier : MIT
import "forge-std/test.sol";
import "forge-std/console.sol";

pragma solidity ^0.8.19;

interface IWETH {
    function balanceOf(address) external view returns (uint256);
    function deposit() external payable;
}

contract Forktest is Test {
    IWETH public weth;

    function setUp() public {
        weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function testDeposit() public {
        console.log(address(this));
        uint256 balBefore = weth.balanceOf(address(this));
        console.log(address(this));
        console.log(balBefore);
        weth.deposit{value: 100}();
        uint256 balAfter = weth.balanceOf(address(this));
        console.log(balAfter);
    }
}
