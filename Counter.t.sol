// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import "forge-std/console.sol";

contract CounterTest is Test, Counter {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testIncrement() public {
        counter.getInc();
        assertEq(counter.count(), 1);
    }

    function testDecrementUnderflow() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.getDec();
    }

    function testdecUnderflow() public {
        counter.getInc();
        counter.getInc();
        counter.getDec();
        console.logInt(1);
        assertEq(counter.count(), 1);
    }
}
