//SPDX License Identifier : MIT

pragma solidity 0.8.21;

import {addressCheck} from "../src/address.sol";
import "forge-std/console.sol";
import "forge-std/Test.sol";

contract testAdd is Test, addressCheck {
    addressCheck public testAddressCheck;
    address public admin = vm.addr(1);

    function setUp() public {
        vm.prank(admin);
        testAddressCheck = new addressCheck();
    }

    function testaddCheck() public {
        vm.startPrank(admin);
        testAddressCheck.addressCheck_();
        vm.stopPrank();
        assertEq(testAddressCheck.owner(), admin);
        console.log(testAddressCheck.owner());
        console.log(address(this));
        console.log(testAddressCheck.owner());
    }
}
