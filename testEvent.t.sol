//SPDX-License-Identifier :MIT

pragma solidity 0.8.21;

import {Event} from "../src/event.sol";
import "forge-std/test.sol";

contract testEvent is Event, Test {
    // event Transfer (address indexed from, address indexed to, uint256 amount);
    Event public e;

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        vm.expectEmit(true, true, false, true);

        emit Transfer(address(this), address(123), 456);
        e.transfer(address(this), address(125), 456);
    }
}
