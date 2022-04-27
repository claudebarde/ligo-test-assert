#include "./utils.mligo"

module LIST =
    struct
        // checks if a list is empty
        let to_be_empty_curried (type a) (should_be_empty: bool) (list: a list): unit =
            let assertion_name = "ASSERT.LIST." ^ (if should_be_empty then "" else "NOT.") ^ "to_be_empty" in

            let (message, assert_result): string * bool =
                if List.size list = 0n && should_be_empty
                then ("list is empty", true)
                else if List.size list > 0n && not should_be_empty
                then ("list is not empty", true)
                else if List.size list = 0n && not should_be_empty
                then ("list is empty", false)
                else if List.size list > 0n && should_be_empty
                then ("list is not empty", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_empty (type a) (list: a list): unit = to_be_empty_curried true list
        // asserts the size of a list
        let to_have_size_curried (type a) (should_have_size: bool) (list: a list) (expected_size: nat): unit =
            let assertion_name = "ASSERT.LIST." ^ (if should_have_size then "" else "NOT.") ^ "to_have_size" in

        let (message, assert_result): string * bool =
            if List.size list = expected_size && should_have_size
            then ("list is of the expected size", true)
            else if List.size list <> expected_size && not should_have_size
            then ("list is not of the provided size", true)
            else if List.size list = expected_size && not should_have_size
            then ("list is of the provided size", false)
            else if List.size list <> expected_size && should_have_size
            then ("list is not of the provided size", false)
            else ("", false)
        in
        
        let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_size (type a) (list: a list) (expected_size: nat): unit = to_have_size_curried true list expected_size
        // asserts the head of a list
        let to_have_head_curried (type a) (should_have_head: bool) (list: a list) (expected_head: a): unit =
            let assertion_name = "ASSERT.LIST." ^ (if should_have_head then "" else "NOT.") ^ "to_have_head" in

            let (message, assert_result): string * bool =
                match List.head_opt list with
                | None -> ("the provided list is empty", false)
                | Some hd -> 
                    if (compare_values hd expected_head) = true && should_have_head
                    then ("list has the expected head", true)
                    else if (compare_values hd expected_head) = false && not should_have_head
                    then ("list doesn't have the provided head", true)
                    else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_head (type a) (list: a list) (expected_head: a): unit = to_have_head_curried true list expected_head
        // checks if a list contains the given value
        let to_contain_curried (type a) (should_have_val: bool) (list: a list) (val: a): unit =
            let assertion_name = "ASSERT.LIST." ^ (if should_have_val then "" else "NOT.") ^ "to_contain" in

            let fold (has_val, val_in_list: bool * a): bool = 
                if compare_values val val_in_list
                then true
                else has_val
            in
            let res = List.fold fold list false in

            let (message, assert_result): string * bool =
                if res && should_have_val
                then ("list has provided value", true)
                else if not res && not should_have_val
                then ("list doesn't have provided value", true)
                else if res && not should_have_val
                then ("list has provided value", false)
                else if not res && should_have_val
                then ("list doesn't have provided value", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_contain (type a) (list: a list) (val: a): unit = to_contain_curried true list val

        module NOT =
            struct
                let to_be_empty (type a) (list: a list): unit = to_be_empty_curried false list

                let to_have_size (type a) (list: a list) (expected_size: nat): unit = to_have_size_curried false list expected_size

                let to_have_head (type a) (list: a list) (expected_head: a): unit = to_have_head_curried false list expected_head

                let to_contain (type a) (list: a list) (val: a): unit = to_contain_curried false list val
            end           
    end