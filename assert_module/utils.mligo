let compare_values (type a) (val_a: a) (val_b: a): bool =
    //Bytes.pack val_a = Bytes.pack val_b
    Test.compile_value val_a = Test.compile_value val_b

let success_message (module_name: string) (function_name: string): string =
    "+++ ASSERT." ^ module_name ^ "." ^ function_name ^ " successful"

let error_message (module_name: string) (function_name: string): string =
    "--- ASSERT." ^ module_name ^ "." ^ function_name ^ " failed"

let build_result_message (test_name: string) (message: string) (assert_result: bool): string =
    let symbol = if assert_result then "+++ " else "--- " in
    let message =
        if assert_result
        then message
        else if not assert_result && String.length message > 0n
        then "assertion failed (" ^ message ^ ")"
        else "assertion failed"
    in
    symbol ^ test_name ^ " => " ^ message