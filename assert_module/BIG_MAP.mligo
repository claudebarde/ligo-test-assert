#include "./utils.mligo"

module BIG_MAP =
    struct
        // checks if provided big_map has provided key
        let has_key (type k v) (key: k) (bigmap: ((k, v) big_map)) (bigmap_name: string) (expected: bool): unit =
            match (Big_map.find_opt key bigmap) with
            | None -> 
                let result = if expected = false then true else false in
                if result = true
                then
                    let _ = 
                        Test.log ("+++ ASSERT.BIG_MAP.has_key => '" ^ bigmap_name ^ "' big_map doesn't have key") in
                    assert true
                else
                    let _ = 
                        Test.log ("--- ASSERT.BIG_MAP.has_key => '" ^ bigmap_name ^ "' big_map doesn't have key") in
                    assert false
            | Some (val) -> 
                let result = if expected = false then false else true in
                if result = true
                then
                    let _ = 
                        Test.log ("+++ ASSERT.BIG_MAP.has_key => '" ^ bigmap_name ^ "' big_map has key") in
                    assert true
                else
                    let _ = 
                        Test.log ("--- ASSERT.BIG_MAP.has_key => '" ^ bigmap_name ^ "' big_map has key") in
                    assert false
        // checks if value in big_map at provided key is the expected value
        let value_equals (type k v) (key: k) (expected_val: v) (bigmap: ((k, v) big_map)): unit =
            match (Big_map.find_opt key bigmap) with
            | None -> 
                let _ = Test.log "--- ASSERT.BIG_MAP.value_equals => values are not equal (no value in big_map)" in
                assert false
            | Some (val) -> 
                if (compare_values val expected_val)
                then 
                    let _ = Test.log "+++ ASSERT.BIG_MAP.value_equals => values are equal" in
                    assert true 
                else 
                    let _ = Test.log "--- ASSERT.BIG_MAP.value_equals => values are not equal" in
                    assert false
    end