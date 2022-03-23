(*
    UTILS functions reserved for admin
*)

(* Updates the admin's address *)
let update_admin (p, s: address * storage): storage =
    if Tezos.sender <> s.admin
    then (failwith "NOT_AN_ADMIN": storage)
    else { s with admin = p }

(* Updates the metadata *)
let update_metadata (p, s: bytes * storage): storage =
    if Tezos.sender <> s.admin
    then (failwith "NOT_AN_ADMIN": storage)
    else { s with metadata = Big_map.update "contents" (Some (p)) s.metadata }

(* Updates the token metadata *)
let update_token_metadata (p, s: (token_id * bytes) * storage): storage =
    if Tezos.sender <> s.admin
    then (failwith "NOT_AN_ADMIN": storage)
    else 
        let (token_id, metadata) = p in
        if not Big_map.mem token_id s.token_metadata
        then (failwith "FA2_TOKEN_UNDEFINED": storage)
        else
            let new_token_info = {
                token_id = token_id;
                token_info = Map.literal [ ("", metadata) ]
            } 
            in { s with token_metadata = Big_map.update token_id (Some new_token_info) s.token_metadata }