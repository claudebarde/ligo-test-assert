let apply_transfer (((from, s), transfer): (address * storage) * transfer_to): address * storage =
    let { to_ = recipient; token_id = token_id; amount = amt } = transfer in
    // checks if token_id is valid
    if not Big_map.mem token_id s.token_metadata
    then (failwith "FA2_TOKEN_UNDEFINED": address * storage)
    else
        // checks if amount is 1n
        if amt <> 1n
        then (failwith "AMOUNT_CAN_ONLY_BE_1": address * storage)
        else
            // checks is sender is allowed to request a transfer
            let operator = { owner = from; operator = Tezos.sender; token_id = token_id } in
            if Tezos.sender <> from && not Big_map.mem operator s.operators
            then (failwith "FA2_NOT_OPERATOR": address * storage)
            else
                // removes the token from the sender's account
                let new_ledger: ledger = 
                    Big_map.remove (from, token_id) s.ledger in
                // adds the token to the recipient's account
                let new_ledger: ledger =
                    match Big_map.find_opt (recipient, token_id) new_ledger with
                    | None -> Big_map.add (recipient, token_id) 1n new_ledger
                    | Some _ -> Big_map.update (recipient, token_id) (Some 1n) new_ledger
                in

                from, { s with ledger = new_ledger }

let process_transfer (s, transfer: storage * transfer_param): storage =
    let { from_ = from; txs = txs } = transfer in
    let (_, new_storage): address * storage =
        List.fold apply_transfer txs (from, s)
    in new_storage

let transfer (transfer_list, s: (transfer_param list) * storage): storage =
    List.fold process_transfer transfer_list s