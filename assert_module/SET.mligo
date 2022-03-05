#include "./utils.mligo"

module SET =
    struct
        // checks if a set is empty
        let is_empty (type a) (set: a set): unit =
            if Set.size set = 0n
            then
                let _ = Test.log ("+++ Set is empty") in
                assert true
            else
                let _ = Test.log ("--- Set is not empty") in
                assert false
        // asserts the size of a set
        let has_size (type a) (set: a set) (expected_size: nat): unit =
            if Set.size set = expected_size
            then
                let _ = Test.log ("+++ Set is of the expected size") in
                assert true
            else
                let _ = Test.log ("--- Set is not of the expected size") in
                assert false
        // checks if a set contains the given value
        let has_value (type a) (set: a set) (val: a): unit =
            let fold (has_val, val_in_set: bool * a): bool = 
                if compare_values val val_in_set
                then true
                else has_val
            in
            let res = Set.fold fold set false in
            if res
            then
                let _ = Test.log ("+++ Set has provided value") in
                assert true
            else
                let _ = Test.log ("--- Set doesn't have provided value") in
                assert false
    end