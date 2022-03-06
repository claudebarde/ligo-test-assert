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

        let to_have_length_curried (should_have_length: bool) (string: string) (expected_length: nat) =
            let assertion_name = "ASSERT.STRING." ^ (if should_have_length then "" else "NOT.") ^ "to_have_length" in

            let (message, assert_result): string * bool =
                if String.length string = expected_length && should_have_length
                then ("string has the expected length", true)
                else if String.length string <> expected_length && not should_have_length
                then ("string doesn't have the expected length", true)
                else if String.length string = expected_length && not should_have_length
                then ("string has the expected length", false)
                else if String.length string <> expected_length && should_have_length
                then ("string doesn't have the expected length", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_length (string: string) (expected_length: nat) =
            to_have_length_curried true string expected_length

        let to_have_same_length_curried (should_have_same_length: bool) (string_a: string) (string_b: string) =
            let assertion_name = "ASSERT.STRING." ^ (if should_have_same_length then "" else "NOT.") ^ "to_have_same_length" in

            let (message, assert_result): string * bool =
                if String.length string_a = String.length string_b && should_have_same_length
                then ("strings have the same length", true)
                else if String.length string_a <> String.length string_b && not should_have_same_length
                then ("strings don't have the same length", true)
                else if String.length string_a = String.length string_b && not should_have_same_length
                then ("strings have the same length", false)
                else if String.length string_a <> String.length string_b && should_have_same_length
                then ("strings don't have the same length", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_same_length (string_a: string) (string_b: string) =
            to_have_same_length_curried true string_a string_b

        let to_have_sub_curried (should_have_sub: bool) (string: string) (start: nat) (length: nat) (expected_sub: string) =
            let assertion_name = "ASSERT.STRING." ^ (if should_have_sub then "" else "NOT.") ^ "to_have_sub" in

            let sub = String.sub start length string in
            let (message, assert_result): string * bool =
                if sub = expected_sub && should_have_sub
                then ("string has expected substring", true)
                else if sub <> expected_sub && not should_have_sub
                then ("string doesn't have expected substring", true)
                else if sub = expected_sub && not should_have_sub
                then ("string has provided substring", false)
                else if sub <> expected_sub && should_have_sub
                then ("string doesn't have provided substring", true)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_sub (string: string) (start: nat) (length: nat) (expected_sub: string) =
            to_have_sub_curried true string start length expected_sub

        let to_include_sub_curried (should_include: bool) (string: string) (expected_sub: string) =
            let assertion_name = "ASSERT.STRING." ^ (if should_include then "" else "NOT.") ^ "to_include_sub" in

            let rec find_sub (str: string) (pos: nat) (substr: string): bool =
                if pos > String.length str || (pos + String.length substr) > String.length str
                then false
                else
                    if String.sub pos (String.length substr) str = substr
                    then true
                    else find_sub str (pos + 1n) substr
            in

            let (message, assert_result): string * bool =
                if find_sub string 0n expected_sub = true && should_include
                then ("string includes the expected substring", true)
                else if find_sub string 0n expected_sub = false && not should_include
                then ("string doesn't include the expected substring", true)
                else if find_sub string 0n expected_sub = true && not should_include
                then ("string includes the expected substring", false)
                else if find_sub string 0n expected_sub = false && should_include
                then ("string doesn't include the expected substring", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_include_sub (string: string) (expected_sub: string) =
            to_include_sub_curried true string expected_sub

        module NOT =
            struct
                let to_be_equal (string_a: string) (string_b: string) =
                    to_be_equal_curried false string_a string_b

                let to_have_length (string: string) (expected_length: nat) =
                    to_have_length_curried false string expected_length

                let to_have_same_length (string_a: string) (string_b: string) =
                    to_have_same_length_curried false string_a string_b

                let to_have_sub (string: string) (start: nat) (length: nat) (expected_sub: string) =
                    to_have_sub_curried false string start length expected_sub

                let to_include_sub (string: string) (expected_sub: string) =
                    to_include_sub_curried false string expected_sub
            end
    end