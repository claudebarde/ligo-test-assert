module CONTRACT =
    struct
        let to_have_storage_curried (type p s) (should_be_equal: bool) (address: (p, s) typed_address) (expected_storage: s) =
            let effective_storage = Test.get_storage address in
            let storages_are_equal = 
                Test.michelson_equal (Test.compile_value expected_storage) (Test.compile_value effective_storage) in

            let (message, assert_result): string * bool =
                if storages_are_equal && should_be_equal
                then ("+++ ASSERT.CONTRACT.to_have_storage => contract has expected storage", true)
                else if not storages_are_equal && not should_be_equal
                then ("+++ ASSERT.CONTRACT.to_have_storage => contract doesn't have expected storage", true)
                else if storages_are_equal && not should_be_equal
                then ("--- ASSERT.CONTRACT.to_have_storage => assertion failed (storages are equal)", false)
                else if not storages_are_equal && should_be_equal
                then ("--- ASSERT.CONTRACT.to_have_storage => assertion failed (storages are not equal)", false)
                else
                    ("--- ASSERT.CONTRACT.to_have_storage => assertion failed", false)
            in

            let _ = Test.log message in assert assert_result

            (* let (message, assert_result): string * bool =
                match (storages_are_equal, should_be_equal) with
                // should pass
                | (true, true) -> ("+++ ASSERT.CONTRACT.to_have_storage => contract has expected storage", true)
                | (false, false) -> ("+++ ASSERT.CONTRACT.to_have_storage => contract doesn't have expected storage", true)
                // should fail
                | (true, false) -> ("--- ASSERT.CONTRACT.to_have_storage => assertion failed (storages are equal)", false)
                | (false, true) -> ("--- ASSERT.CONTRACT.to_have_storage => assertion failed (storages are not equal)", false)
            in

            let _ = Test.log message in assert assert_result *)

        let to_have_storage (type p s) (address: (p, s) typed_address) (expected_storage: s) =
            to_have_storage_curried true address expected_storage
        
        let to_have_balance_curried (type p s) (should_be_equal: bool) (address: (p, s) typed_address) (expected_balance: tez) =
            let contract_address = Tezos.address (Test.to_contract address) in
            let balance: tez = Test.get_balance contract_address in

            let (message, assert_result): string * bool =
                if balance = expected_balance && should_be_equal
                then ("+++ ASSERT.CONTRACT.to_have_balance => contract has expected balance", true)
                else if balance <> expected_balance && not should_be_equal
                then ("+++ ASSERT.CONTRACT.to_have_balance => contract doesn't have expected balance", true)
                else if balance = expected_balance && not should_be_equal
                then ("--- ASSERT.CONTRACT.to_have_balance => assertion failed (balances are equal)", false)
                else if balance <> expected_balance && should_be_equal
                then ("--- ASSERT.CONTRACT.to_have_balance => assertion failed (balances are not equal)", false)
                else
                    ("--- ASSERT.CONTRACT.to_have_balance => assertion failed", false)
            in

            let _ = Test.log message in assert assert_result

        let to_have_balance (type p s) (address: (p, s) typed_address) (expected_balance: tez) =
            to_have_balance_curried true address expected_balance

        module NOT =
            struct
                let to_have_storage (type p s) (address: (p, s) typed_address) (expected_storage: s) =
                    to_have_storage_curried false address expected_storage

                let to_have_balance (type p s) (address: (p, s) typed_address) (expected_balance: tez) =
                    to_have_balance_curried true address expected_balance
            end
    end