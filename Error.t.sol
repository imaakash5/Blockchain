//SPDX-License-Identifier :MIT

pragma solidity 0.8.21;

import {Error} from "../src/Error.sol";
import "forge-std/test.sol";

contract erro is Error, Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public {
        err.thrownError();
    }

    function testRevert() public {
        vm.expectRevert();
        err.thrownError();
    }

    function testreqMsg() public {
        vm.expectRevert(bytes("test case passed, error thrown"));
        err.thrownError();
    }

    function testthrowCustomMsg() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomMsg();
    }
}
