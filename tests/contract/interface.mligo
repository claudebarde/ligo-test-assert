type token_id = nat
type ipfs_hash = bytes

(*
    TRANSFER PARAMS
*)

type transfer_to =
[@layout:comb]
{
    to_     : address;
    token_id: token_id;
    amount  : nat;
}

type transfer_param = 
[@layout:comb]
{
    from_   : address;
    txs     : transfer_to list
}

(*
    UPDATE OPERATORS PARAMS
*)

type operator =
[@layout:comb]
{
    owner   : address;
    operator: address;
    token_id: token_id
}

type update_operators_param =
| Add_operator of operator
| Remove_operator of operator

(*
    BALANCE OF PARAMS
*)

type balance_of_request =
[@layout:comb]
{
    owner   : address;
    token_id: token_id;
}

type balance_of_callback_param =
[@layout:comb]
{
    request: balance_of_request;
    balance: nat;
}

type balance_of_param =
[@layout:comb]
{
    requests: balance_of_request list;
    callback: (balance_of_callback_param list) contract;
}

(*
    STORAGE AND PARAMETER
*)

// parameter type
type parameter = 
    | Transfer of transfer_param list
    | Update_operators of update_operators_param list
    | Balance_of of balance_of_param
    | Update_admin of address
    | Update_metadata of bytes
    | Update_token_metadata of (token_id * bytes)

// storage type
type ledger = ((address * token_id), nat) big_map
type token_metadata = 
[@layout:comb]
{
    token_id: nat;
    token_info: (string, bytes) map
}
type storage =
{
    ledger              : ledger;
    operators           : (operator, unit) big_map;
    metadata            : (string, bytes) big_map;
    token_metadata      : (token_id, token_metadata) big_map;
    total_supply        : nat;
    admin               : address;
}

type return = (operation list) * storage