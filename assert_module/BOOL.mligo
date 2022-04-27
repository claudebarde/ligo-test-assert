#include "./utils.mligo"

module BOOL =
    struct
        let to_be_true_curried (should_be_true: bool) (val: bool) =
            let assertion_name = "ASSERT.BOOL." ^ (if should_be_true then "" else "NOT.") ^ "to_be_true" in

            let (message, assert_result): string * bool =
                if val = true && should_be_true
                then ("value is true", true)
                else if val = false && not should_be_true
                then ("value is false", true)
                else if val = true && not should_be_true
                then ("value is true instead of false", false)
                else if val = false && should_be_true
                then ("value is false instead of true", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_true (val: bool) =
            to_be_true_curried true val

        let to_be_false_curried (should_be_false: bool) (val: bool) =
            let assertion_name = "ASSERT.BOOL." ^ (if should_be_false then "" else "NOT.") ^ "to_be_false" in

            let (message, assert_result): string * bool =
                if val = false && should_be_false
                then ("value is false", true)
                else if val = true && not should_be_false
                then ("value is true", true)
                else if val = true && should_be_false
                then ("value is true instead of false", false)
                else if val = false && not should_be_false
                then ("value is false instead of true", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_false (val: bool) =
            to_be_false_curried true val

        module NOT =
            struct
                let to_be_true (val: bool) =
                    to_be_true_curried false val

                let to_be_false (val: bool) =
                    to_be_false_curried false val
            end
    end