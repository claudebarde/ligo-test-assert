#include "./utils.mligo"

module LIST =
    struct
        // checks if a list is empty
        let to_be_empty_curried (type a) (not_: bool) (list: a list): unit =
            if List.size list = 0n && not_
            then
                let _ = Test.log ("+++ List is empty") in
                assert true
            else if List.size list > 0n && not not_
            then
                let _ = Test.log ("+++ List is not empty") in
                assert true
            else
                let _ = Test.log ("--- Assertion of list content failed") in
                assert false

        let to_be_empty (type a) (list: a list): unit = to_be_empty_curried true list
        // asserts the size of a list
        let to_have_size_curried (type a) (should_have_size: bool) (list: a list) (expected_size: nat): unit =
            if List.size list = expected_size && should_have_size
            then
                let _ = Test.log ("+++ List is of the expected size") in
                assert true
            else if List.size list <> expected_size && not should_have_size
            then
                let _ = Test.log ("+++ List is not of the provided size") in
                assert true
            else
                let _ = Test.log ("--- Assertion of list size failed") in
                assert false

        let to_have_size (type a) (list: a list) (expected_size: nat): unit = to_have_size_curried true list expected_size
        // asserts the head of a list
        let to_have_head_curried (type a) (should_have_head: bool) (list: a list) (expected_head: a): unit =
            match List.head_opt list with
            | None -> 
                let _ = Test.log ("--- The provided list is empty") in
                assert false
            | Some hd -> 
                if (compare_values hd expected_head) = true && should_have_head
                then
                    let _ = Test.log ("+++ List has the expected head") in
                    assert true
                else if (compare_values hd expected_head) = false && not should_have_head
                then
                    let _ = Test.log ("+++ List doesn't have the provided head") in
                    assert true
                else
                    let _ = Test.log ("+++ Assertion of list head failed") in
                    assert false

        let to_have_head (type a) (list: a list) (expected_head: a): unit = to_have_head_curried true list expected_head
        // checks if a list contains the given value
        let to_have_value_curried (type a) (should_have_val: bool) (list: a list) (val: a): unit =
            let fold (has_val, val_in_list: bool * a): bool = 
                if compare_values val val_in_list
                then true
                else has_val
            in
            let res = List.fold fold list false in
            if res && should_have_val
            then
                let _ = Test.log ("+++ List has provided value") in
                assert true
            else if not res && not should_have_val
            then
                let _ = Test.log ("+++ List doesn't have provided value") in
                assert true
            else
                let _ = Test.log ("--- Assertion of value in list failed") in
                assert false

        let to_have_value (type a) (list: a list) (val: a): unit = to_have_value_curried true list val

        module NOT =
            struct
                let to_be_empty (type a) (list: a list): unit = to_be_empty_curried false list

                let to_have_size (type a) (list: a list) (expected_size: nat): unit = to_have_size_curried false list expected_size

                let to_have_head (type a) (list: a list) (expected_head: a): unit = to_have_head_curried false list expected_head

                let to_have_value (type a) (list: a list) (val: a): unit = to_have_value_curried false list val
            end           
    end