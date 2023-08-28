//SPDX License Idetifier:MIT

pragma solidity ^0.8.20;

import "../src/HelloWorld.sol";
import "forge-std/Test.sol";

contract HelloWorldTest is HelloWorld, Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function testGreet() public {
        assertEq(helloWorld.greet(), "HelloWorld");
    }
}
