#include "./utils.mligo"

module ENTRYPOINT =
    struct            
        let to_succeed_curried (should_succeed: bool) (call: test_exec_result) (message: string option): unit =
            let assertion_name = "ASSERT.ENTRYPOINT." ^ (if should_succeed then "" else "NOT.") ^ "to_succeed" in

            let (message, assert_result): string * bool =
                match call with
                | Success (_) -> 
                    begin
                        if should_succeed
                        then 
                            (match message with
                                | None -> ("entrypoint call successful", true)
                                | Some msg -> (msg, true))
                        else
                            (error_message "ENTRYPOINT" "to_succeed", false)
                    end
                | Fail (_) -> 
                    begin
                        if should_succeed
                        then 
                            (error_message "ENTRYPOINT" "to_succeed", false)
                        else
                            (match message with
                                | None -> ("entrypoint call successful", true)
                                | Some msg -> (msg, true))
                    end
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_succeed (call: test_exec_result) (message: string option): unit =
            to_succeed_curried true call message

        let to_fail_curried (should_fail: bool) (call: test_exec_result) (message: string option): unit =
            let assertion_name = "ASSERT.ENTRYPOINT." ^ (if should_fail then "" else "NOT.") ^ "to_fail" in

            let (message, assert_result): string * bool =
                match call with
                | Success (_) -> 
                    begin
                        if should_fail
                        then 
                            (error_message "ENTRYPOINT" "to_fail", false)
                        else
                            (match message with
                                | None -> ("entrypoint call successful", true)
                                | Some msg -> (msg, true))
                    end
                | Fail (_) -> 
                    begin
                        if should_fail
                        then 
                            (match message with
                                | None -> ("entrypoint call failed", true)
                                | Some msg -> (msg, true))
                        else
                            (error_message "ENTRYPOINT" "to_fail", false)
                    end
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_fail (call: test_exec_result) (message: string option): unit =
            to_fail_curried true call message

        let to_fail_with_message_curried (should_fail: bool) (call: test_exec_result) (expected_error_msg: string) (message: string option): unit =
            let assertion_name = "ASSERT.ENTRYPOINT." ^ (if should_fail then "" else "NOT.") ^ "to_fail_with_message" in

            let (message, assert_result): string * bool =
                match call with
                | Success (_) -> 
                    begin
                        if should_fail
                        then 
                            (error_message "ENTRYPOINT" "to_fail_with_message", false)
                        else
                            (match message with
                                | None -> ("entrypoint call successful", true)
                                | Some msg -> (msg, true))
                    end
                | Fail (error) -> 
                    begin
                        if should_fail
                        then 
                            begin
                                match error with
                                | Rejected (err, _) ->
                                    if err = Test.compile_value expected_error_msg
                                    then 
                                        (match message with
                                            | None -> ("entrypoint call failed", true)
                                            | Some msg -> (msg, true))
                                    else 
                                        (error_message "ENTRYPOINT" "to_fail_with_message", false)
                                | _ -> (error_message "ENTRYPOINT" "to_fail_with_message", false)
                            end
                        else
                            (error_message "ENTRYPOINT" "to_fail_with_message", false)
                    end
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_fail_with_message (call: test_exec_result) (expected_error_msg: string) (message: string option): unit =
            to_fail_with_message_curried true call expected_error_msg message

        (* let to_fail_with_message (call: test_exec_result) (expected_error_msg: string) (message: string option): unit =
            match call with
            | Fail (error) -> 
                begin
                    match error with
                    | Rejected (err, _) ->
                        if err = Test.compile_value expected_error_msg
                        then 
                            begin
                                let _ = match message with
                                    | None -> Test.log (success_message "ENTRYPOINT" "to_fail_with_message")
                                    | Some msg -> Test.log ("+++ " ^ msg)
                                in
                                assert true
                            end
                        else 
                            let _ = Test.log (error_message "ENTRYPOINT" "to_fail_with_message") in
                            assert false
                    | Other -> 
                        let _ = Test.log (error_message "ENTRYPOINT" "to_fail_with_message") in
                        assert false
                end
            | Success (_) ->
                let _ = Test.log (error_message "ENTRYPOINT" "to_fail_with_message") in
                assert false *)
    end