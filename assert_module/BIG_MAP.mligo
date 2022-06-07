#include "./utils.mligo"

module BIG_MAP =
    struct
        // checks if provided big_map has provided key
        let to_have_key_curried 
            (type k v) (should_have_key: bool) (key: k) (bigmap: ((k, v) big_map)) (bigmap_name: string): unit =
            let assertion_name = "ASSERT.BIG_MAP." ^ (if should_have_key then "" else "NOT.") ^ "to_have_key" in

            let (message, assert_result): string * bool =
                match (Big_map.find_opt key bigmap) with
                | None -> 
                    if should_have_key
                    then ("big_map " ^ bigmap_name ^ " doesn't have key", false)
                    else ("big_map " ^ bigmap_name ^ " doesn't have key", true)
                | Some (_) -> 
                    if should_have_key
                    then ("big_map " ^ bigmap_name ^ " has key", true)
                    else ("big_map " ^ bigmap_name ^ " has key", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_key (type k v) (key: k) (bigmap: ((k, v) big_map)) (bigmap_name: string) =
            to_have_key_curried true key bigmap bigmap_name
        // checks if value in big_map at provided key is the expected value
        let value_equals_curried 
            (type k v) (should_be_equal: bool) (key: k) (expected_val: v) (bigmap: ((k, v) big_map)): unit =
            let assertion_name = "ASSERT.BIG_MAP." ^ (if should_be_equal then "" else "NOT.") ^ "value_equals" in

            let (message, assert_result): string * bool =
                match (Big_map.find_opt key bigmap) with
                | None -> ("key doesn't exist in big_map", false)
                | Some (val) -> 
                    let res = Test.michelson_equal (Test.compile_value val) (Test.compile_value expected_val) in
                    if res && should_be_equal
                    then ("values are equal", true)
                    else if not res && not should_be_equal
                    then ("values are not equal", true)
                    else if res && not should_be_equal
                    then ("values are equal", false)
                    else if not res && should_be_equal
                    then ("values are not equal", false)
                    else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let value_equals (type k v) (key: k) (expected_val: v) (bigmap: ((k, v) big_map)) =
            value_equals_curried true key expected_val bigmap

        module NOT =
            struct
                let to_have_key (type k v) (key: k) (bigmap: ((k, v) big_map)) (bigmap_name: string) =
                    to_have_key_curried false key bigmap bigmap_name

                let value_equals (type k v) (key: k) (expected_val: v) (bigmap: ((k, v) big_map)) =
                    value_equals_curried false key expected_val bigmap
            end
    end