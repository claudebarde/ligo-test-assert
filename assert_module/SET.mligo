#include "./utils.mligo"

module SET =
    struct
        // checks if a set is empty
        let to_be_empty_curried (type a) (should_be_empty: bool) (set: a set): unit =
            let assertion_name = "ASSERT.SET." ^ (if should_be_empty then "" else "NOT.") ^ "is_empty" in

            let (message, assert_result): string * bool =
                if Set.size set = 0n && should_be_empty
                then ("set is empty", true)
                else if Set.size set > 0n && not should_be_empty
                then ("set is not empty", true)
                else if Set.size set = 0n && not should_be_empty
                then ("set is empty", false)
                else if Set.size set > 0n && should_be_empty
                then ("set is not empty", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_empty (type a) (set: a set): unit = to_be_empty_curried true set
        // asserts the size of a set
        let to_have_size_curried (type a) (should_have_size: bool) (set: a set) (expected_size: nat): unit =
            let assertion_name = "ASSERT.SET." ^ (if should_have_size then "" else "NOT.") ^ "to_have_size" in

            let (message, assert_result): string * bool =
                if Set.size set = expected_size && should_have_size
                then ("set is of the expected size", true)
                else if Set.size set <> expected_size && not should_have_size
                then ("set is not of the provided size", true)
                else if Set.size set = expected_size && not should_have_size
                then ("set is of the provided size", false)
                else if Set.size set <> expected_size && should_have_size
                then ("set is not of the provided size", false)
                else ("", false)
            in
            
            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_have_size (type a) (set: a set) (expected_size: nat): unit = to_have_size_curried true set expected_size
        // checks if a set contains the given value
        let to_contain_curried (type a) (should_have_val: bool) (set: a set) (val: a): unit =
            let assertion_name = "ASSERT.SET." ^ (if should_have_val then "" else "NOT.") ^ "to_contain" in

            let fold (has_val, val_in_set: bool * a): bool = 
                if compare_values val val_in_set
                then true
                else has_val
            in
            let res = Set.fold fold set false in
            
            let (message, assert_result): string * bool =
                if res && should_have_val
                then ("set has provided value", true)
                else if not res && not should_have_val
                then ("set doesn't have provided value", true)
                else if res && not should_have_val
                then ("set has provided value", false)
                else if not res && should_have_val
                then ("set doesn't have provided value", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_contain (type a) (set: a set) (val: a): unit = to_contain_curried true set val

        module NOT =
            struct
                let to_be_empty (type a) (set: a set): unit = to_be_empty_curried false set 

                let to_have_size (type a) (set: a set) (expected_size: nat): unit = to_have_size_curried false set expected_size

                let to_contain (type a) (set: a set) (val: a): unit = to_contain_curried false set val
            end
    end