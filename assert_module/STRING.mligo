#include "./utils.mligo"

module STRING =
    struct
        let to_be_equal_curried (should_be_equal: bool) (string_a: string) (string_b: string) =
            let assertion_name = "ASSERT.STRING." ^ (if should_be_equal then "" else "NOT.") ^ "to_be_equal" in

            let strings_are_equal = 
                Test.michelson_equal (Test.compile_value string_a) (Test.compile_value string_b) in
            let (message, assert_result): string * bool =
                if strings_are_equal && should_be_equal
                then ("strings are equal", true)
                else if not strings_are_equal && not should_be_equal
                then ("strings are not equal", true)
                else if strings_are_equal && not should_be_equal
                then ("strings are equal", false)
                else if not strings_are_equal && should_be_equal
                then ("strings are not equal", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_equal (string_a: string) (string_b: string) =
            to_be_equal_curried true string_a string_b

        module NOT =
            struct
                let to_be_equal (string_a: string) (string_b: string) =
                    to_be_equal_curried false string_a string_b
            end
    end