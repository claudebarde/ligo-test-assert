let update_operators (operators_list, s: (update_operators_param list) * storage): storage =
    List.fold
        (
            fun ((s, operator_param): storage * update_operators_param) ->
                match operator_param with
                | Add_operator operator ->
                    if Tezos.sender <> operator.owner
                    then (failwith "FA2_NOT_OWNER": storage)
                    else
                        { s with operators = Big_map.add operator unit s.operators }
                | Remove_operator operator->
                    if Tezos.sender <> operator.owner
                    then (failwith "FA2_NOT_OWNER": storage)
                    else
                        { s with operators = Big_map.remove operator s.operators }
        )
        operators_list
        s