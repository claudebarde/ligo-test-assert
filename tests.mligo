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
    // to_be_empty
    let list: int list = [] in
    let _ = ASSERT.LIST.to_be_empty list in
    let list: int list = [1;2;3;4] in
    let _ = ASSERT.LIST.NOT.to_be_empty list in
    // has_size
    let list: int list = [1; 2; 3; 4] in
    let _ = ASSERT.LIST.to_have_size list 4n in
    let _ = ASSERT.LIST.NOT.to_have_size list 5n in
    // to_have_head
    let _ = ASSERT.LIST.to_have_head list 1 in
    let _ = ASSERT.LIST.NOT.to_have_head list 2 in
    // to_have_value
    let _ = ASSERT.LIST.to_have_value list 3 in
    let _ = ASSERT.LIST.NOT.to_have_value list 5 in

    ()