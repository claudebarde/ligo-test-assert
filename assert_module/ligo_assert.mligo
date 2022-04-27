#import "./INT.mligo" "INT_MODULE"
#import "./NAT.mligo" "NAT_MODULE"
#import "./MUTEZ.mligo" "MUTEZ_MODULE"
#import "./ENTRYPOINT.mligo" "ENTRYPOINT_MODULE"
#import "./BIG_MAP.mligo" "BIG_MAP_MODULE"
#import "./MAP.mligo" "MAP_MODULE"
#import "./LIST.mligo" "LIST_MODULE"
#import "./SET.mligo" "SET_MODULE"
#import "./CONTRACT.mligo" "CONTRACT_MODULE"
#import "./STRING.mligo" "STRING_MODULE"
#import "./OPTION.mligo" "OPTION_MODULE"
#import "./BOOL.mligo" "BOOL_MODULE"

module ASSERT =
    struct
        module INT = INT_MODULE.INT

        module NAT = NAT_MODULE.NAT

        module MUTEZ = MUTEZ_MODULE.MUTEZ

        module ENTRYPOINT = ENTRYPOINT_MODULE.ENTRYPOINT

        module BIG_MAP = BIG_MAP_MODULE.BIG_MAP

        module MAP = MAP_MODULE.MAP

        module LIST = LIST_MODULE.LIST

        module SET = SET_MODULE.SET

        module CONTRACT = CONTRACT_MODULE.CONTRACT

        module STRING = STRING_MODULE.STRING

        module OPTION = OPTION_MODULE.OPTION

        module BOOL = BOOL_MODULE.BOOL

        module SETUP = 
            struct
                let init (p: unit): { alice_address: address; bob_address: address } =
                    let _ = Test.reset_state 3n ([]: tez list) in
                    { 
                        alice_address = Test.nth_bootstrap_account 1; 
                        bob_address = Test.nth_bootstrap_account 2 
                    }
            end
    end

module FORMAT =
    struct
        let add_title (title: string): unit = Test.log ("====== " ^ title ^ " ======")
    end