module ASSERT =
    struct
        let compare_values (type a) (val_a: a) (val_b: a): bool =
            //Bytes.pack val_a = Bytes.pack val_b
            Test.compile_value val_a = Test.compile_value val_b

        let success_message (module_name: string) (function_name: string): string =
            "+++ ASSERT." ^ module_name ^ "." ^ function_name ^ " successful"

        let error_message (module_name: string) (function_name: string): string =
            "--- ASSERT." ^ module_name ^ "." ^ function_name ^ " failed"

        module INT =
            struct
                type compared_type = int
                let is_greater_than (left: compared_type) (right: compared_type): unit =
                    if left > right
                    then
                        let _ = Test.log ("+++ First value is greater than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater than second") in
                        assert false
                let is_less_than (left: compared_type) (right: compared_type): unit =
                    if left < right
                    then
                        let _ = Test.log ("+++ First value is less than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less than second") in
                        assert false
                let is_greater_or_equal (left: compared_type) (right: compared_type): unit =
                    if left >= right
                    then
                        let _ = Test.log ("+++ First value is greater or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater or equal to second") in
                        assert false
                let is_less_or_equal (left: compared_type) (right: compared_type): unit =
                    if left <= right
                    then
                        let _ = Test.log ("+++ First value is less or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less or equal to second") in
                        assert false
                let is_equal (left: compared_type) (right: compared_type): unit =
                    if left = right
                    then
                        let _ = Test.log ("+++ First value is equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not equal to second") in
                        assert false
                let is_not_equal (left: compared_type) (right: compared_type): unit =
                    if left <> right
                    then
                        let _ = Test.log ("+++ First value is not equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is equal to second") in
                        assert false
                let is_greater_than_nat (left: compared_type) (right: nat): unit =
                    if left > int (right)
                    then
                        let _ = Test.log ("+++ First value is greater than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater than second") in
                        assert false
                let is_less_than_nat (left: compared_type) (right: nat): unit =
                    if left < int (right)
                    then
                        let _ = Test.log ("+++ First value is less than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less than second") in
                        assert false
                let is_greater_or_equal_to_nat (left: compared_type) (right: nat): unit =
                    if left >= int (right)
                    then
                        let _ = Test.log ("+++ First value is greater or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater or equal to second") in
                        assert false
                let is_less_or_equal_to_nat (left: compared_type) (right: nat): unit =
                    if left <= int (right)
                    then
                        let _ = Test.log ("+++ First value is less or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less or equal to second") in
                        assert false
                let is_equal_to_nat (left: compared_type) (right: nat): unit =
                    if left = int (right)
                    then
                        let _ = Test.log ("+++ First value is equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not equal to second") in
                        assert false
                let is_not_equal_to_nat (left: compared_type) (right: nat): unit =
                    if left <> int (right)
                    then
                        let _ = Test.log ("+++ First value is not equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is equal to second") in
                        assert false
            end

        module NAT =
            struct
                type compared_type = nat
                let is_greater_than (left: compared_type) (right: compared_type): unit =
                    if left > right
                    then
                        let _ = Test.log ("+++ First value is greater than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater than second") in
                        assert false
                let is_less_than (left: compared_type) (right: compared_type): unit =
                    if left < right
                    then
                        let _ = Test.log ("+++ First value is less than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less than second") in
                        assert false
                let is_greater_or_equal (left: compared_type) (right: compared_type): unit =
                    if left >= right
                    then
                        let _ = Test.log ("+++ First value is greater or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater or equal to second") in
                        assert false
                let is_less_or_equal (left: compared_type) (right: compared_type): unit =
                    if left <= right
                    then
                        let _ = Test.log ("+++ First value is less or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less or equal to second") in
                        assert false
                let is_equal (left: compared_type) (right: compared_type): unit =
                    if left = right
                    then
                        let _ = Test.log ("+++ First value is equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not equal to second") in
                        assert false
                let is_not_equal (left: compared_type) (right: compared_type): unit =
                    if left <> right
                    then
                        let _ = Test.log ("+++ First value is not equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is equal to second") in
                        assert false
                let is_greater_than_int (left: compared_type) (right: int): unit =
                    if left > abs (right)
                    then
                        let _ = Test.log ("+++ First value is greater than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater than second") in
                        assert false
                let is_less_than_int (left: compared_type) (right: int): unit =
                    if left < abs (right)
                    then
                        let _ = Test.log ("+++ First value is less than second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less than second") in
                        assert false
                let is_greater_or_equal_to_int (left: compared_type) (right: int): unit =
                    if left >= abs (right)
                    then
                        let _ = Test.log ("+++ First value is greater or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not greater or equal to second") in
                        assert false
                let is_less_or_equal_to_int (left: compared_type) (right: int): unit =
                    if left <= abs (right)
                    then
                        let _ = Test.log ("+++ First value is less or equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not less or equal to second") in
                        assert false
                let is_equal_to_int (left: compared_type) (right: int): unit =
                    if left = abs (right)
                    then
                        let _ = Test.log ("+++ First value is equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is not equal to second") in
                        assert false
                let is_not_equal_to_int (left: compared_type) (right: int): unit =
                    if left <> abs (right)
                    then
                        let _ = Test.log ("+++ First value is not equal to second") in
                        assert true
                    else
                        let _ = Test.log ("--- First value is equal to second") in
                        assert false
            end

        module ENTRYPOINT =
            struct
                let should_succeed (call: test_exec_result) (message: string option): unit =
                    match call with
                    | Success (_) -> 
                        begin
                            let _ = match message with
                                | None -> Test.log (success_message "ENTRYPOINT" "should_succeed")
                                | Some msg -> Test.log ("+++ " ^ msg)
                            in
                            assert true
                        end
                    | Fail (_) -> 
                        let _ = Test.log (error_message "ENTRYPOINT" "should_succeed") in
                        assert false

                let should_fail (call: test_exec_result) (message: string option): unit =
                    match call with
                    | Success (_) -> 
                        let _ = Test.log (error_message "ENTRYPOINT" "should_fail") in
                        assert false
                    | Fail (_) -> 
                        begin
                            let _ = match message with
                                | None -> Test.log (success_message "ENTRYPOINT" "should_fail")
                                | Some msg -> Test.log ("+++ " ^ msg)
                            in
                            assert true
                        end

                let should_fail_with_message (call: test_exec_result) (expected_error_msg: string) (message: string option): unit =
                    match call with
                    | Fail (error) -> 
                        begin
                            match error with
                            | Rejected (err, _) ->
                                if err = Test.compile_value expected_error_msg
                                then 
                                    begin
                                        let _ = match message with
                                            | None -> Test.log (success_message "ENTRYPOINT" "should_fail_with_message")
                                            | Some msg -> Test.log ("+++ " ^ msg)
                                        in
                                        assert true
                                    end
                                else 
                                    let _ = Test.log (error_message "ENTRYPOINT" "should_fail_with_message") in
                                    assert false
                            | Other -> 
                                let _ = Test.log (error_message "ENTRYPOINT" "should_fail_with_message") in
                                assert false
                        end
                    | Success (_) ->
                        let _ = Test.log (error_message "ENTRYPOINT" "should_fail_with_message") in
                        assert false
            end

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

        module LIST =
            struct
                // checks if a list is empty
                (* let is_empty (type a) (list: a list): unit =
                    if List.size list = 0n
                    then
                        let _ = Test.log ("+++ List is empty") in
                        assert true
                    else
                        let _ = Test.log ("--- List is not empty") in
                        assert false *)

                let is_empty_curried (type a) (not_: bool) (list: a list): unit =
                    if List.size list = 0n && not_
                    then
                        let _ = Test.log ("+++ List is empty") in
                        assert true
                    else if List.size list > 0n && not not_
                    then
                        let _ = Test.log ("+++ List is not empty") in
                        assert true
                    else
                        let _ = Test.log ("--- List size assertion failed") in
                        assert false

                let is_empty (type a) (list: a list): unit = is_empty_curried true list

                module NOT =
                    struct
                        let is_empty_ (type a) (list: a list): unit = is_empty_curried false list
                    end
                // asserts the size of a list
                let has_size (type a) (list: a list) (expected_size: nat): unit =
                    if List.size list = expected_size
                    then
                        let _ = Test.log ("+++ List is of the expected size") in
                        assert true
                    else
                        let _ = Test.log ("--- List is not of the expected size") in
                        assert false
                // asserts the head of a list
                let has_head (type a) (list: a list) (expected_head: a): unit =
                    match List.head_opt list with
                    | None -> 
                        let _ = Test.log ("--- The provided list is empty") in
                        assert false
                    | Some hd -> 
                        if (compare_values hd expected_head) = true
                        then
                            let _ = Test.log ("+++ List has the expected head") in
                            assert true
                        else
                            let _ = Test.log ("--- List doesn't have the expected head") in
                            assert false
                // checks if a list contains the given value
                let has_value (type a) (list: a list) (val: a): unit =
                    let fold (has_val, val_in_list: bool * a): bool = 
                        if compare_values val val_in_list
                        then true
                        else has_val
                    in
                    let res = List.fold fold list false in
                    if res
                    then
                        let _ = Test.log ("+++ List has provided value") in
                        assert true
                    else
                        let _ = Test.log ("--- List doesn't have provided value") in
                        assert false                
            end

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
    end

module FORMAT =
    struct
        let add_title (title: string): unit = Test.log ("====== " ^ title ^ " ======")
    end