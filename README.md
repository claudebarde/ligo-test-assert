# Ligo ASSERT library

## Focus on tests and not on code when writing tests with the Ligo [Test](https://ligolang.org/docs/advanced/testing#testing-with-test) framework!

The ASSERT library makes it easier to run tests in Ligo (with the CameLigo syntax) by leveraging the Test framework.

### - How to use

The ASSERT library is 100% written in Ligo, and uses the [Ligo Docker image](https://hub.docker.com/r/ligolang/ligo) to compile the tests.

`npm run docker-update`

> To download the newest version or update your local version of Ligo

`git clone https://github.com/claudebarde/ligo-test-assert.git && cd ligo-test-assert && npm i`

> The ASSERT library uses **nodemon** to watch changes in your Ligo code as well as **zx** and **chalk** to display the test results.

Then delete the content of the `tests` file in the `tests` directory but keep this at the top of your main test file:

```
#import "../assert_module/ligo_assert.mligo" "TEST"
module ASSERT = TEST.ASSERT
```

You're ready to go!

You can now launch the tests:

- You can run the `Test` framework directly without pretty-printing the output with `npm run assert -- path/to/test/file.mligo`
- You can use the JavaScript file in the project to pretty-print the output: `npm run assert:js -- path/to/test/file.mligo`

### - ASSERT API

The ASSERT library is made of submodules with names tied to what they do or what values they test.
Currently:

**ADDRESS**: tests on `address` values  
**BOOL**: tests on `bool` values  
**BIG_MAP**: tests on `big_map` values  
**CONTRACT**: tests for contracts  
**ENTRYPOINT**: tests for contract entrypoints  
**INT**: tests on `int` values  
**LIST**: tests on `list` values  
**MAP**: tests on `map` values  
**MUTEZ**: tests on `mutez` values  
**NAT**: tests on `nat` values  
**OPTION**: tests for `option` values  
**SET**: tests on `set` values  
**STRING**: tests for `string` values

Many tests can be negated by using the `NOT` module, for example:

`ASSERT.NAT.to_be_equal 3n 3n`

> passes

`ASSERT.NAT.NOT.to_be_equal 3n 3n`

> fails

### - Examples

`ASSERT.INT.to_be_greater_than 34 22`

> passes

`ASSERT.NAT.to_be_equal_to_int 5n 5`

> passes

```
let list: int list = [] in
let _ = ASSERT.LIST.to_be_empty list in
```

> passes

```
let list: int list = [1; 2; 3; 4] in
let _ = ASSERT.LIST.to_have_value list 3 in
let _ = ASSERT.LIST.NOT.to_have_value list 5 in
```

> passes

```
let params =
    [
        {
            from_ = alice_address;
            txs = [
                { to_ = bob_address; token_id = 0n; amount = 10n }
            ]
        }
    ] in
let _ =
    ASSERT.ENTRYPOINT.should_succeed
        (Test.transfer_to_contract contract (Transfer (params)) 0tez)
        (Some "Transfer from Alice to Bob successful!")
    in
```

> passes if call to entrypoint succeeds

### SETUP and FORMAT

You can use the `SETUP` module to set up the testing environment:

```
let { alice_address; bob_address } = ASSERT.SETUP.init () in
```

This will return `alice_address` and `bob_address` that will not be the baker's address in order to avoid unexpected results during the tests.

If you want to improve the readability of the test outputs, you can insert titles in your code using the `FORMAT` module:

```
let _ = FORMAT.add_title "FIRST TESTS" in
```
