let balance_of (p, s: balance_of_param * storage): operation list * storage =
    // creates the list of all requested balances
    let list_of_balances: balance_of_callback_param list =
        List.map
            (
                fun (req: balance_of_request): balance_of_callback_param ->
                    if not Big_map.mem req.token_id s.token_metadata
                    then (failwith "FA2_TOKEN_UNDEFINED": balance_of_callback_param)
                    else
                        match Big_map.find_opt (req.owner, req.token_id) s.ledger with
                        | None -> { request = { owner = req.owner; token_id = req.token_id }; balance = 0n }
                        | Some b -> { request = { owner = req.owner; token_id = req.token_id }; balance = b }
            )
            p.requests
    in
    // forges operation for callback and returns storage
    [Tezos.transaction list_of_balances 0tez p.callback], s