#import "./ligo_assert.mligo" "TEST"
module ASSERT = TEST.ASSERT
module FORMAT = TEST.FORMAT

let test =
    (*
        INT MODULE TESTS
    *)
    let _ = FORMAT.add_title "INT MODULE TESTS" in
    // is_equal
    let val_a = 2 in
    let val_b = 2 in
    let _ = ASSERT.INT.is_equal val_a val_b in
    // is_not_equal
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.is_not_equal val_a val_b in
    // is_greater_than
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.is_greater_than val_b val_a in
    // is_less_than
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.is_less_than val_a val_b in
    // is_greater_or_equal
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.is_greater_or_equal val_b val_a in
    let val_a = 2 in
    let val_b = 2 in
    let _ = ASSERT.INT.is_greater_or_equal val_b val_a in
    // is_less_or_equal
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.is_less_or_equal val_a val_b in
    let val_a = 2 in
    let val_b = 2 in
    let _ = ASSERT.INT.is_less_or_equal val_a val_b in
    // is_greater_than_nat
    let val_a = 3 in
    let val_b = 2n in
    let _ = ASSERT.INT.is_greater_than_nat val_a val_b in
    // is_less_than_nat
    let val_a = 2 in
    let val_b = 3n in
    let _ = ASSERT.INT.is_less_than_nat val_a val_b in
    // is_greater_or_equal_to_nat
    let val_a = 3 in
    let val_b = 2n in
    let _ = ASSERT.INT.is_greater_or_equal_to_nat val_a val_b in
    let val_a = 3 in
    let val_b = 3n in
    let _ = ASSERT.INT.is_greater_or_equal_to_nat val_a val_b in
    // is_less_or_equal
    let val_a = 2 in
    let val_b = 3n in
    let _ = ASSERT.INT.is_less_or_equal_to_nat val_a val_b in
    let val_a = 2 in
    let val_b = 2n in
    let _ = ASSERT.INT.is_less_or_equal_to_nat val_a val_b in
    // is_equal_to_nat
    let val_a = 2 in
    let val_b = 2n in
    let _ = ASSERT.INT.is_equal_to_nat val_a val_b in
    // is_not_equal_to_nat
    let val_a = 2 in
    let val_b = 3n in
    let _ = ASSERT.INT.is_not_equal_to_nat val_a val_b in
    (*
        NAT MODULE TESTS
    *)
    let _ = FORMAT.add_title "NAT MODULE TESTS" in
    // is_equal
    let val_a = 2n in
    let val_b = 2n in
    let _ = ASSERT.NAT.is_equal val_a val_b in
    // is_not_equal
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.is_not_equal val_a val_b in
    // is_greater_than
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.is_greater_than val_b val_a in
    // is_less_than
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.is_less_than val_a val_b in
    // is_greater_or_equal
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.is_greater_or_equal val_b val_a in
    let val_a = 2n in
    let val_b = 2n in
    let _ = ASSERT.NAT.is_greater_or_equal val_b val_a in
    // is_less_or_equal
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.is_less_or_equal val_a val_b in
    let val_a = 2n in
    let val_b = 2n in
    let _ = ASSERT.NAT.is_less_or_equal val_a val_b in
    // is_greater_than_int
    let val_a = 3n in
    let val_b = 2 in
    let _ = ASSERT.NAT.is_greater_than_int val_a val_b in
    // is_less_than_nat
    let val_a = 2n in
    let val_b = 3 in
    let _ = ASSERT.NAT.is_less_than_int val_a val_b in
    // is_greater_or_equal_to_nat
    let val_a = 3n in
    let val_b = 2 in
    let _ = ASSERT.NAT.is_greater_or_equal_to_int val_a val_b in
    let val_a = 3n in
    let val_b = 3 in
    let _ = ASSERT.NAT.is_greater_or_equal_to_int val_a val_b in
    // is_less_or_equal
    let val_a = 2n in
    let val_b = 3 in
    let _ = ASSERT.NAT.is_less_or_equal_to_int val_a val_b in
    let val_a = 2n in
    let val_b = 2 in
    let _ = ASSERT.NAT.is_less_or_equal_to_int val_a val_b in
    // is_equal_to_nat
    let val_a = 2n in
    let val_b = 2 in
    let _ = ASSERT.NAT.is_equal_to_int val_a val_b in
    // is_not_equal_to_nat
    let val_a = 2n in
    let val_b = 3 in
    let _ = ASSERT.NAT.is_not_equal_to_int val_a val_b in
    (*
        LIST MODULE TESTS
    *)
    let _ = FORMAT.add_title "LIST MODULE TESTS" in
    // is_empty
    let list: int list = [] in
    let _ = ASSERT.LIST.is_empty list in
    // has_size
    let list: int list = [1; 2; 3; 4] in
    let _ = ASSERT.LIST.has_size list 4n in
    // has_head
    let _ = ASSERT.LIST.has_head list 1 in
    // has_value
    let _ = ASSERT.LIST.has_value list 3 in

    (* let list: int list = [] in
    let _ = ASSERT.LIST.is_empty_curried true list in
    let list: int list = [1;2;3;4] in
    let _ = ASSERT.LIST.is_empty_curried false list in *)

    let list: int list = [] in
    let _ = ASSERT.LIST.is_empty list in
    let list: int list = [1;2;3;4] in
    let _ = ASSERT.LIST.NOT.is_empty_ list in

    ()