#import "./INT.mligo" "INT_MODULE"
#import "./NAT.mligo" "NAT_MODULE"
#import "./ENTRYPOINT.mligo" "ENTRYPOINT_MODULE"
#import "./BIG_MAP.mligo" "BIG_MAP_MODULE"
#import "./MAP.mligo" "MAP_MODULE"
#import "./LIST.mligo" "LIST_MODULE"
#import "./SET.mligo" "SET_MODULE"

module ASSERT =
    struct
        module INT = INT_MODULE.INT

        module NAT = NAT_MODULE.NAT

        module ENTRYPOINT = ENTRYPOINT_MODULE.ENTRYPOINT

        module BIG_MAP = BIG_MAP_MODULE.BIG_MAP

        module MAP = MAP_MODULE.MAP

        module LIST = LIST_MODULE.LIST

        module SET = SET_MODULE.SET
    end

module FORMAT =
    struct
        let add_title (title: string): unit = Test.log ("====== " ^ title ^ " ======")
    end