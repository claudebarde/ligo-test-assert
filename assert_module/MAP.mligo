#include "./utils.mligo"

module MAP =
    struct
        // checks if a map is empty
        let is_empty (type k v) (map: (k, v) map): unit =
            if Map.size map = 0n
            then
                let _ = Test.log ("+++ Map is empty") in
                assert true
            else
                let _ = Test.log ("--- Map is not empty") in
                assert false
        // checks if provided map has provided key
        let has_key (type k v) (key: k) (map: ((k, v) big_map)) (map_name: string) (expected: bool): unit =
            match (Map.find_opt key map) with
            | None -> 
                let result = if expected = false then true else false in
                if result = true
                then
                    let _ = Test.log ("+++ ASSERT.MAP.has_key => '" ^ map_name ^ "' map doesn't have key") in
                    assert true
                else
                    let _ = Test.log ("--- ASSERT.MAP.has_key => '" ^ map_name ^ "' map doesn't have key") in
                    assert false
            | Some (val) -> 
                let result = if expected = false then false else true in
                if result = true
                then
                    let _ = Test.log ("+++ ASSERT.MAP.has_key => '" ^ map_name ^ "' map has key") in
                    assert true
                else
                    let _ = Test.log ("--- ASSERT.MAP.has_key => '" ^ map_name ^ "' map has key") in
                    assert false
        // checks if value in map at provided key is the expected value
        let value_equals (type k v) (key: k) (expected_val: v) (map: ((k, v) map)): bool =
            match (Big_map.find_opt key map) with
            | None -> false
            | Some (val) -> if compare_values val expected_val then true else false
        // checks if the map is of the expected size
        let has_size (type k v) (map: ((k, v) map)) (expected_size: nat): unit =
            if Map.size map = expected_size
            then
                let _ = Test.log ("+++ Map is of the expected size") in
                assert true
            else
                let _ = Test.log ("--- Map is not of the expected size") in
                assert false
    end