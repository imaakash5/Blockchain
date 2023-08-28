//SPDX License Identifier:MIT

pragma solidity 0.8.21;

import "forge-std/console.sol";
import "../src/testLog_.sol";
import "forge-std/Test.sol";

contract testLog_Test is testLog_, Test {
    testLog_ public TestLogT_;

    function setUp() public {
        TestLogT_ = new testLog_();
    }

    function testingLog() public {
        TestLogT_._testLog();
    }
}
