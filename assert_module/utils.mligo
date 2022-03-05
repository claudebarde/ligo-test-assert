let compare_values (type a) (val_a: a) (val_b: a): bool =
    //Bytes.pack val_a = Bytes.pack val_b
    Test.compile_value val_a = Test.compile_value val_b

let success_message (module_name: string) (function_name: string): string =
    "+++ ASSERT." ^ module_name ^ "." ^ function_name ^ " successful"

let error_message (module_name: string) (function_name: string): string =
    "--- ASSERT." ^ module_name ^ "." ^ function_name ^ " failed"