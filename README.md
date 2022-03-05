# Ligo ASSERT library

## Focus on tests and not on code when writing tests with the Ligo [Test](https://ligolang.org/docs/advanced/testing#testing-with-test) framework!

The ASSERT library makes it easier to run tests in Ligo (with the CameLigo syntax) by leveraging the Test framework.

### - How to use

The ASSERT library is 100% written in Ligo, and uses Docker to compile the tests.

`npm run docker-update`

> To download the newest version or update your local version of Ligo

`git clone https://github.com/claudebarde/ligo-test-assert.git && cd ligo-test-assert && npm i`

> The ASSERT library uses Nodemon to watch changes in your Ligo code

Then delete the content of the `tests` file in the `tests` directory but keep this at the top:

```
#import "../assert_module/ligo_assert.mligo" "TEST"
module ASSERT = TEST.ASSERT
```

You're ready to go!

### - ASSERT API

The ASSERT library is made of submodules with names tied to what they do or what values they test.
Currently:

**INT**: tests on `int` values  
**NAT**: tests on `nat` values  
**LIST**: tests on `list` values  
**SET**: tests on `set` values  
**MAP**: tests on `map` values  
**BIG_MAP**: tests on `big_map` values  
**ENTRYPOINT**: tests for contract entrypoints

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
