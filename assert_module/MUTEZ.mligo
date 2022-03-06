#include "./utils.mligo"

module MUTEZ =
    struct
        type compared_type = tez
        let to_be_greater_than_curried (should_be_greater: bool) (left: compared_type) (right: compared_type): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_greater then "" else "NOT.") ^ "to_be_greater_than" in

            let (message, assert_result): string * bool =
                if left > right && should_be_greater
                then ("first value is greater than second", true)
                else if left <= right && not should_be_greater
                then ("first value is not greater than second", true)
                else if left <= right && should_be_greater
                then ("first value is not greater than second", false)
                else if left > right && not should_be_greater
                then ("first value is greater than second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_greater_than (left: compared_type) (right: compared_type): unit = 
                    to_be_greater_than_curried true left right

        let to_be_less_than_curried (should_be_less_than: bool) (left: compared_type) (right: compared_type): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_less_than then "" else "NOT.") ^ "to_be_less_than" in

            let (message, assert_result): string * bool =
                if left < right && should_be_less_than
                then ("first value is less than second", true)
                else if left >= right && not should_be_less_than
                then ("first value is not less than second", true)
                else if left < right && not should_be_less_than
                then ("first value is less than second", false)
                else if left >= right && should_be_less_than
                then ("first value is not less than second", false) 
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_less_than (left: compared_type) (right: compared_type): unit =
            to_be_less_than_curried true left right

        let to_be_greater_or_equal_curried (should_be_greater_or_equal: bool) (left: compared_type) (right: compared_type): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_greater_or_equal then "" else "NOT.") ^ "to_be_greater_or_equal" in

            let (message, assert_result): string * bool =
                if left >= right && should_be_greater_or_equal
                then ("first value is greater or equal to second", true)
                else if left < right && not should_be_greater_or_equal
                then ("first value is not greater to second", true)
                else if left >= right && not should_be_greater_or_equal
                then ("first value is greater or equal to second", false)
                else if left < right && should_be_greater_or_equal
                then ("first value is not greater to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_greater_or_equal (left: compared_type) (right: compared_type): unit =
            to_be_greater_or_equal_curried true left right

        let to_be_less_or_equal_curried (should_be_less_or_equal: bool) (left: compared_type) (right: compared_type): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_less_or_equal then "" else "NOT.") ^ "to_be_less_or_equal" in
            
            let (message, assert_result): string * bool =
                if left <= right && should_be_less_or_equal
                then ("first value is less or equal to second", true)
                else if left > right && not should_be_less_or_equal
                then ("first value is not less or equal to second", true)
                else if left <= right && not should_be_less_or_equal
                then ("first value is less or equal to second", false)
                else if left > right && should_be_less_or_equal
                then ("first value is not less or equal to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_less_or_equal (left: compared_type) (right: compared_type): unit =
            to_be_less_or_equal_curried true left right

        let to_be_equal_curried (should_be_equal: bool) (left: compared_type) (right: compared_type): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_equal then "" else "NOT.") ^ "to_be_equal" in
            
            let (message, assert_result): string * bool =
                if left = right && should_be_equal
                then ("first value is equal to second", true)
                else if left <> right && not should_be_equal
                then ("first value is not equal to second", true)
                else if left = right && not should_be_equal
                then ("first value is equal to second", false)
                else if left <> right && should_be_equal
                then ("first value is not equal to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_equal (left: compared_type) (right: compared_type): unit =
            to_be_equal_curried true left right

        let to_be_greater_than_nat_curried (should_be_greater: bool) (left: compared_type) (right: nat): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_greater then "" else "NOT.") ^ "to_be_greater_than_nat" in
            
            let right = right * 1mutez in
            let (message, assert_result): string * bool =
                if left > right && should_be_greater
                then ("first value is greater than second", true)
                else if left <= right && not should_be_greater
                then ("first value is not greater than second", true)
                else if left > right && not should_be_greater
                then ("first value is greater than second", false)
                else if left <= right && should_be_greater
                then ("first value is not greater than second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result


        let to_be_greater_than_nat (left: compared_type) (right: nat): unit = 
                    to_be_greater_than_nat_curried true left right

        let to_be_less_than_nat_curried (should_be_less_than: bool) (left: compared_type) (right: nat): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_less_than then "" else "NOT.") ^ "to_be_less_than_nat" in
            
            let right = right * 1mutez in
            let (message, assert_result): string * bool =
                if left < right && should_be_less_than
                then ("first value is less than second", true)
                else if left >= right && not should_be_less_than
                then ("first value is not less than second", true)
                else if left < right && not should_be_less_than
                then ("first value is less than second", false)
                else if left >= right && should_be_less_than
                then ("first value is not less than second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_less_than_nat (left: compared_type) (right: nat): unit =
            to_be_less_than_nat_curried true left right

        let to_be_greater_or_equal_to_nat_curried (should_be_greater_or_equal: bool) (left: compared_type) (right: nat): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_greater_or_equal then "" else "NOT.") ^ "to_be_greater_or_equal_to_nat" in
            
            let right = right * 1mutez in
            let (message, assert_result): string * bool =
                if left >= right && should_be_greater_or_equal
                then ("first value is greater or equal to second", true)
                else if left < right && not should_be_greater_or_equal
                then ("first value is not greater to second", true)
                else if left >= right && not should_be_greater_or_equal
                then ("first value is greater or equal to second", false)
                else if left < right && should_be_greater_or_equal
                then ("first value is not greater to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_greater_or_equal_to_nat (left: compared_type) (right: nat): unit =
            to_be_greater_or_equal_to_nat_curried true left right

        let to_be_less_or_equal_to_nat_curried (should_be_less_or_equal: bool) (left: compared_type) (right: nat): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_less_or_equal then "" else "NOT.") ^ "to_be_greater_than" in
            
            let right = right * 1mutez in
            let (message, assert_result): string * bool =
                if left <= right && should_be_less_or_equal
                then ("first value is less or equal to second", true)
                else if left > right && not should_be_less_or_equal
                then ("first value is not less or equal to second", true)
                else if left <= right && not should_be_less_or_equal
                then ("first value is less or equal to second", false)
                else if left > right && should_be_less_or_equal
                then ("first value is not less or equal to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_less_or_equal_to_nat (left: compared_type) (right: nat): unit =
            to_be_less_or_equal_to_nat_curried true left right

        let to_be_equal_to_nat_curried (should_be_equal: bool) (left: compared_type) (right: nat): unit =
            let assertion_name = "ASSERT.MUTEZ." ^ (if should_be_equal then "" else "NOT.") ^ "to_be_equal_to" in
            
            let right = right * 1mutez in
            let (message, assert_result): string * bool =
                if left = right && should_be_equal
                then ("first value is equal to second", true)
                else if left <> right && not should_be_equal
                then ("first value is not equal to second", true)
                else if left = right && not should_be_equal
                then ("first value is equal to second", false)
                else if left <> right && should_be_equal
                then ("first value is not equal to second", false)
                else ("", false)
            in

            let _ = Test.log (build_result_message assertion_name message assert_result) in assert assert_result

        let to_be_equal_to_nat (left: compared_type) (right: nat): unit =
            to_be_equal_to_nat_curried true left right     

        module NOT =
            struct
                let to_be_greater_than (left: compared_type) (right: compared_type): unit = 
                    to_be_greater_than_curried false left right

                let to_be_less_than (left: compared_type) (right: compared_type): unit =
                    to_be_less_than_curried false left right

                let to_be_greater_or_equal (left: compared_type) (right: compared_type): unit =
                    to_be_greater_or_equal_curried false left right

                let to_be_less_or_equal (left: compared_type) (right: compared_type): unit =
                    to_be_less_or_equal_curried false left right

                let to_be_equal (left: compared_type) (right: compared_type): unit =
                    to_be_equal_curried false left right

                let to_be_greater_than_nat (left: compared_type) (right: nat): unit = 
                    to_be_greater_than_nat_curried false left right

                let to_be_less_than_nat (left: compared_type) (right: nat): unit =
                    to_be_less_than_nat_curried false left right

                let to_be_greater_or_equal_to_nat (left: compared_type) (right: nat): unit =
                    to_be_greater_or_equal_to_nat_curried false left right

                let to_be_less_or_equal_to_nat (left: compared_type) (right: nat): unit =
                    to_be_less_or_equal_to_nat_curried false left right

                let to_be_equal_to_nat (left: compared_type) (right: nat): unit =
                    to_be_equal_to_nat_curried false left right     
            end           
    end