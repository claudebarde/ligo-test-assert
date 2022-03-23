#include "./utils.mligo"

module ENTRYPOINT =
    struct            
        let to_succeed (call: test_exec_result) (message: string option): unit =
            match call with
            | Success (_) -> 
                begin
                    let _ = match message with
                        | None -> Test.log (success_message "ENTRYPOINT" "to_succeed")
                        | Some msg -> Test.log ("+++ " ^ msg)
                    in
                    assert true
                end
            | Fail (_) -> 
                let _ = Test.log (error_message "ENTRYPOINT" "to_succeed") in
                assert false

        let to_fail (call: test_exec_result) (message: string option): unit =
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

        let to_fail_with_message (call: test_exec_result) (expected_error_msg: string) (message: string option): unit =
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