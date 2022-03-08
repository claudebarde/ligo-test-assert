#include "./utils.mligo"

module OPTION =
    struct
        let to_be_none_curried (type a) (should_be_none: bool) (val: a option) =
            let assertion_name = "ASSERT.OPTION." ^ (if should_be_none then "" else "NOT.") ^ "to_be_none" in

            let (message, assert_result): string * bool =
                match val with
                | None -> 
                    if should_be_none
                    then ("value is none", true)
                    else ("value is none", false)
                | Some _ ->
                    if should_be_none
                    then ("value is some", false)
                    else ("value is some", true)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_none (type a) (val: a option) =
            to_be_none_curried true val

        let to_be_some_curried (type a) (should_be_some: bool) (val: a option) =
            let assertion_name = "ASSERT.OPTION." ^ (if should_be_some then "" else "NOT.") ^ "to_be_some" in

            let (message, assert_result): string * bool =
                match val with
                | None -> 
                    if should_be_some
                    then ("value is none", false)
                    else ("value is none", true)
                | Some _ ->
                    if should_be_some
                    then ("value is some", true)
                    else ("value is some", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_some (type a) (val: a option) =
            to_be_some_curried true val

        let to_be_some_value_curried (type a) (should_be_some_value: bool) (opt_val: a option) (val: a) =
            let assertion_name = "ASSERT.OPTION." ^ (if should_be_some_value then "" else "NOT.") ^ "to_be_some_value" in

            let (message, assert_result): string * bool =
                match opt_val with
                | None -> ("option value is none", false)
                | Some v ->
                    if should_be_some_value && compare_values v val = true
                    then ("option value is the expected value", true)
                    else if not should_be_some_value && compare_values v val = false
                    then ("option value is not the provided value", true)
                    else if should_be_some_value && compare_values v val = false
                    then ("option value is not the expected value", false)
                    else if not should_be_some_value && compare_values v val = true
                    then ("option value is the provided value", false)
                    else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_some_value (type a) (opt_val: a option) (val: a) =
            to_be_some_value_curried true opt_val val

        module NOT =
            struct
                let to_be_none (type a) (val: a option) =
                    to_be_none_curried false val

                let to_be_some (type a) (val: a option) =
                    to_be_some_curried false val

                let to_be_some_value (type a) (opt_val: a option) (val: a) =
                    to_be_some_value_curried false opt_val val
            end
    end