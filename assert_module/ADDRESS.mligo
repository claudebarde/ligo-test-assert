#include "./utils.mligo"

module ADDRESS =
    struct
        let to_be_equal_curried (should_be_equal: bool) (address_a: address) (address_b: address) =
            let assertion_name = "ASSERT.ADDRESS." ^ (if should_be_equal then "" else "NOT.") ^ "to_be_equal" in

            let addresses_are_equal = 
                Test.michelson_equal (Test.compile_value address_a) (Test.compile_value address_b) in
            let (message, assert_result): string * bool =
                if addresses_are_equal && should_be_equal
                then ("addresses are equal", true)
                else if not addresses_are_equal && not should_be_equal
                then ("addresses are not equal", true)
                else if addresses_are_equal && not should_be_equal
                then ("addresses are equal", false)
                else if not addresses_are_equal && should_be_equal
                then ("addresses are not equal", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_equal (address_a: address) (address_b: address) =
            to_be_equal_curried true address_a address_b

        module NOT =
            struct
                let to_be_equal (address_a: address) (address_b: address) =
                    to_be_equal_curried false address_a address_b
            end
    end