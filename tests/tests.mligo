#import "../assert_module/ligo_assert.mligo" "TEST"
module ASSERT = TEST.ASSERT
module FORMAT = TEST.FORMAT
#include "./contract/main.mligo"

let test =
    let { alice_address; bob_address } = ASSERT.SETUP.init () in
    (*
        INT MODULE TESTS
    *)
    let _ = FORMAT.add_title "INT MODULE TESTS" in
    // is_equal
    let val_a = 2 in
    let val_b = 2 in
    let val_c = 3 in
    let _ = ASSERT.INT.to_be_equal val_a val_b in
    let _ = ASSERT.INT.NOT.to_be_equal val_a val_c in
    // to_greater_than
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.to_be_greater_than val_b val_a in
    let _ = ASSERT.INT.NOT.to_be_greater_than val_a val_b in
    // to_be_less_than
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.to_be_less_than val_a val_b in
    let _ = ASSERT.INT.NOT.to_be_less_than val_b val_a in
    // is_greater_or_equal
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.INT.NOT.to_be_greater_or_equal val_a val_b in
    let val_a = 2 in
    let val_b = 2 in
    let val_c = 4 in
    let _ = ASSERT.INT.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.INT.NOT.to_be_greater_or_equal val_a val_c in
    // is_less_or_equal
    let val_a = 2 in
    let val_b = 3 in
    let _ = ASSERT.INT.to_be_less_or_equal val_a val_b in
    let _ = ASSERT.INT.NOT.to_be_less_or_equal val_b val_a in
    let val_a = 2 in
    let val_b = 2 in
    let _ = ASSERT.INT.to_be_less_or_equal val_a val_b in
    // is_greater_than_nat
    let val_a = 3 in
    let val_b = 2n in
    let val_c = 1 in
    let _ = ASSERT.INT.to_be_greater_than_nat val_a val_b in
    let _ = ASSERT.INT.NOT.to_be_greater_than_nat val_c val_b in
    // is_less_than_nat
    let val_a = 2 in
    let val_b = 3n in
    let _ = ASSERT.INT.to_be_less_than_nat val_a val_b in
    // is_greater_or_equal_to_nat
    let val_a = 3 in
    let val_b = 2n in
    let _ = ASSERT.INT.to_be_greater_or_equal_to_nat val_a val_b in
    let val_a = 3 in
    let val_b = 3n in
    let _ = ASSERT.INT.to_be_greater_or_equal_to_nat val_a val_b in
    // is_less_or_equal
    let val_a = 2 in
    let val_b = 3n in
    let _ = ASSERT.INT.to_be_less_or_equal_to_nat val_a val_b in
    let val_a = 2 in
    let val_b = 2n in
    let _ = ASSERT.INT.to_be_less_or_equal_to_nat val_a val_b in
    // is_equal_to_nat
    let val_a = 2 in
    let val_b = 2n in
    let _ = ASSERT.INT.to_be_equal_to_nat val_a val_b in
    (*
        NAT MODULE TESTS
    *)
    let _ = FORMAT.add_title "NAT MODULE TESTS" in
    // is_equal
    let val_a = 2n in
    let val_b = 2n in
    let val_c = 3n in
    let _ = ASSERT.NAT.to_be_equal val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_equal val_a val_c in
    // is_greater_than
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.to_be_greater_than val_b val_a in
    let _ = ASSERT.NAT.NOT.to_be_greater_than val_a val_b in
    // is_less_than
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.to_be_less_than val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_less_than val_b val_a in
    // is_greater_or_equal
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.NAT.NOT.to_be_greater_or_equal val_a val_b in
    let val_a = 2n in
    let val_b = 2n in
    let val_c = 1n in
    let _ = ASSERT.NAT.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.NAT.NOT.to_be_greater_or_equal val_c val_a in
    // is_less_or_equal
    let val_a = 2n in
    let val_b = 3n in
    let _ = ASSERT.NAT.to_be_less_or_equal val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_less_or_equal val_b val_a in
    let val_a = 2n in
    let val_b = 2n in
    let _ = ASSERT.NAT.to_be_less_or_equal val_a val_b in
    // is_greater_than_int
    let val_a = 3n in
    let val_b = 2 in
    let val_c = 1n in
    let _ = ASSERT.NAT.to_be_greater_than_int val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_greater_than_int val_c val_b in
    // is_less_than_int
    let val_a = 2n in
    let val_b = 3 in
    let val_c = 4n in
    let _ = ASSERT.NAT.to_be_less_than_int val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_less_than_int val_c val_b in
    // is_greater_or_equal_to_nat
    let val_a = 3n in
    let val_b = 2 in
    let val_c = 1n in
    let _ = ASSERT.NAT.to_be_greater_or_equal_to_int val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_greater_or_equal_to_int val_c val_b in
    let val_a = 3n in
    let val_b = 3 in
    let _ = ASSERT.NAT.to_be_greater_or_equal_to_int val_a val_b in
    // is_less_or_equal
    let val_a = 2n in
    let val_b = 3 in
    let val_c = 4n in
    let _ = ASSERT.NAT.to_be_less_or_equal_to_int val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_less_or_equal_to_int val_c val_b in
    let val_a = 2n in
    let val_b = 2 in
    let _ = ASSERT.NAT.to_be_less_or_equal_to_int val_a val_b in
    // is_equal_to_nat
    let val_a = 2n in
    let val_b = 2 in
    let val_c = 3n in
    let _ = ASSERT.NAT.to_be_equal_to_int val_a val_b in
    let _ = ASSERT.NAT.NOT.to_be_equal_to_int val_c val_b in
    (*
        MUTEZ MODULE TESTS
    *)
    let _ = FORMAT.add_title "MUTEZ MODULE TESTS" in
    // is_equal
    let val_a = 2tez in
    let val_b = 2tez in
    let val_c = 3tez in
    let _ = ASSERT.MUTEZ.to_be_equal val_a val_b in
    let _ = ASSERT.MUTEZ.NOT.to_be_equal val_a val_c in
    // to_greater_than
    let val_a = 2tez in
    let val_b = 3tez in
    let _ = ASSERT.MUTEZ.to_be_greater_than val_b val_a in
    let _ = ASSERT.MUTEZ.NOT.to_be_greater_than val_a val_b in
    // to_be_less_than
    let val_a = 2tez in
    let val_b = 3tez in
    let _ = ASSERT.MUTEZ.to_be_less_than val_a val_b in
    let _ = ASSERT.MUTEZ.NOT.to_be_less_than val_b val_a in
    // is_greater_or_equal
    let val_a = 2tez in
    let val_b = 3tez in
    let _ = ASSERT.MUTEZ.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.MUTEZ.NOT.to_be_greater_or_equal val_a val_b in
    let val_a = 2tez in
    let val_b = 2tez in
    let val_c = 4tez in
    let _ = ASSERT.MUTEZ.to_be_greater_or_equal val_b val_a in
    let _ = ASSERT.MUTEZ.NOT.to_be_greater_or_equal val_a val_c in
    // is_less_or_equal
    let val_a = 2tez in
    let val_b = 3tez in
    let _ = ASSERT.MUTEZ.to_be_less_or_equal val_a val_b in
    let _ = ASSERT.MUTEZ.NOT.to_be_less_or_equal val_b val_a in
    let val_a = 2tez in
    let val_b = 2tez in
    let _ = ASSERT.MUTEZ.to_be_less_or_equal val_a val_b in
    // is_greater_than_nat
    let val_a = 3_000_000mutez in
    let val_b = 2_000_000n in
    let val_c = 1_000_000mutez in
    let _ = ASSERT.MUTEZ.to_be_greater_than_nat val_a val_b in
    let _ = ASSERT.MUTEZ.NOT.to_be_greater_than_nat val_c val_b in
    // is_less_than_nat
    let val_a = 2_000_000mutez in
    let val_b = 3_000_000n in
    let _ = ASSERT.MUTEZ.to_be_less_than_nat val_a val_b in
    // is_greater_or_equal_to_nat
    let val_a = 3_000_000mutez in
    let val_b = 2_000_000n in
    let _ = ASSERT.MUTEZ.to_be_greater_or_equal_to_nat val_a val_b in
    let val_a = 3_000_000mutez in
    let val_b = 3_000_000n in
    let _ = ASSERT.MUTEZ.to_be_greater_or_equal_to_nat val_a val_b in
    // is_less_or_equal
    let val_a = 2_000_000mutez in
    let val_b = 3_000_000n in
    let _ = ASSERT.MUTEZ.to_be_less_or_equal_to_nat val_a val_b in
    let val_a = 2_000_000mutez in
    let val_b = 2_000_000n in
    let _ = ASSERT.MUTEZ.to_be_less_or_equal_to_nat val_a val_b in
    // is_equal_to_nat
    let val_a = 2_000_000mutez in
    let val_b = 2_000_000n in
    let _ = ASSERT.MUTEZ.to_be_equal_to_nat val_a val_b in
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
    // to_contain
    let _ = ASSERT.LIST.to_contain list 3 in
    let _ = ASSERT.LIST.NOT.to_contain list 5 in
    (*
        STRING MODULE TESTS
    *)
    let _ = FORMAT.add_title "STRING MODULE TESTS" in
    // to_be_equal
    let string_a = "ligolang" in
    let string_b = "ligolang" in
    let string_c = "taquito" in
    let _ = ASSERT.STRING.to_be_equal string_a string_b in
    let _ = ASSERT.STRING.NOT.to_be_equal string_a string_c in
    // to_have_length
    let string_a = "ligolang" in
    let _ = ASSERT.STRING.to_have_length string_a 8n in
    let _ = ASSERT.STRING.NOT.to_have_length string_a 6n in
    // to_have_same_length
    let string_a = "ligolang" in
    let string_b = "taquito" in
    let string_c = "mountain" in
    let _ = ASSERT.STRING.to_have_same_length string_a string_c in
    let _ = ASSERT.STRING.NOT.to_have_same_length string_a string_b in
    // to_have_sub
    let string_a = "ligolang" in
    let _ = ASSERT.STRING.to_have_sub string_a 0n 4n "ligo" in
    let _ = ASSERT.STRING.NOT.to_have_sub string_a 0n 4n "lang" in
    // to_include_sub
    let string_a = "ligolang" in
    let _ = ASSERT.STRING.to_include_sub string_a "go" in
    let _ = ASSERT.STRING.NOT.to_include_sub string_a "zz" in
    (*
        OPTION MODULE TESTS
    *)
    let _ = FORMAT.add_title "OPTION MODULE TESTS" in
    // to_be_none
    let val_none = (None: string option) in
    let val_some = Some "ligo" in
    let _ = ASSERT.OPTION.to_be_none val_none in
    let _ = ASSERT.OPTION.NOT.to_be_none val_some in
    // to_be_some
    let val_none = (None: string option) in
    let val_some = Some "ligo" in
    let _ = ASSERT.OPTION.to_be_some val_some in
    let _ = ASSERT.OPTION.NOT.to_be_some val_none in
    // to_be_some_value
    let val_a = "ligo" in
    let val_b = "taquito" in
    let val_some = Some "ligo" in
    let _ = ASSERT.OPTION.to_be_some_value val_some val_a in
    let _ = ASSERT.OPTION.NOT.to_be_some_value val_some val_b in
    (*
        ENTRYPOINT MODULE TESTS
    *)
    let _ = FORMAT.add_title "CONTRACT MODULE TESTS" in
    let initial_storage = {
        ledger              = Big_map.literal [ 
                                ((alice_address, 0n), 1n);
                                ((alice_address, 1n), 1n);
                                ((alice_address, 2n), 1n);
                                ((alice_address, 3n), 1n)
                            ];
        operators           = (Big_map.empty: (operator, unit) big_map);
        metadata            = Big_map.literal [
                                ("", Bytes.pack "This is a test")
                            ];
        token_metadata      = Big_map.literal [ 
                                (0n, { token_id = 0n; token_info = Map.literal [ ("", Bytes.pack "Mock metadata for NFT 0") ]});
                                (1n, { token_id = 1n; token_info = Map.literal [ ("", Bytes.pack "Mock metadata for NFT 1") ]});
                                (2n, { token_id = 2n; token_info = Map.literal [ ("", Bytes.pack "Mock metadata for NFT 2") ]});
                                (3n, { token_id = 3n; token_info = Map.literal [ ("", Bytes.pack "Mock metadata for NFT 3") ]})
                            ];
        total_supply        = 4n;
        admin               = alice_address
    } in
    // originates the contract
    let contract_balance = 5tez in
    let nft_addr, _, _ = Test.originate main initial_storage contract_balance in
    let _ = ASSERT.CONTRACT.to_have_storage nft_addr initial_storage in
    //let _ = ASSERT.CONTRACT.to_have_balance nft_addr contract_balance in

    (*
        SET MODULE TESTS
    *)
    let _ = FORMAT.add_title "SET MODULE TESTS" in
    let empty_set = (Set.empty: nat set) in
    let nat_set = Set.literal [3n; 2n; 4n; 1n] in
    let _ = ASSERT.SET.to_be_empty empty_set in
    let _ = ASSERT.SET.NOT.to_be_empty nat_set in
    let _ = ASSERT.SET.to_contain nat_set 4n in
    let _ = ASSERT.SET.NOT.to_contain nat_set 5n in
    (*
        BOOL MODULE TESTS
    *)
    let _ = FORMAT.add_title "BOOL MODULE TESTS" in
    let is_true = true in
    let is_false = false in
    let _ = ASSERT.BOOL.to_be_true is_true in
    let _ = ASSERT.BOOL.NOT.to_be_true is_false in
    let _ = ASSERT.BOOL.to_be_false is_false in
    let _ = ASSERT.BOOL.NOT.to_be_false is_true in
    (*
        ADDRESS MODULE TESTS
    *)
    let _ = FORMAT.add_title "ADDRESS MODULE TESTS" in
    let address_a = ("tz1Me1MGhK7taay748h4gPnX2cXvbgL6xsYL": address) in
    let address_b = ("tz1VSUr8wwNhLAzempoch5d6hLRiTh8Cjcjb": address) in
    let address_c = ("tz1Me1MGhK7taay748h4gPnX2cXvbgL6xsYL": address) in
    let _ = ASSERT.ADDRESS.to_be_equal address_a address_c in
    let _ = ASSERT.ADDRESS.NOT.to_be_equal address_a address_b in

    ()