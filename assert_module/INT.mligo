module INT =
    struct
        type compared_type = int
        let to_be_greater_than_curried (should_be_greater: bool) (left: compared_type) (right: compared_type): unit =
            if left > right && should_be_greater
            then
                let _ = Test.log ("+++ First value is greater than second") in
                assert true
            else if left <= right && not should_be_greater
            then
                let _ = Test.log ("+++ First value is not greater than second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of greater than failed") in
                assert false

        let to_be_greater_than (left: compared_type) (right: compared_type): unit = 
                    to_be_greater_than_curried true left right

        let to_be_less_than_curried (should_be_less_than: bool) (left: compared_type) (right: compared_type): unit =
            if left < right && should_be_less_than
            then
                let _ = Test.log ("+++ First value is less than second") in
                assert true
            else if left >= right && not should_be_less_than
            then
                let _ = Test.log ("+++ First value is not less than second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of less than failed") in
                assert false

        let to_be_less_than (left: compared_type) (right: compared_type): unit =
            to_be_less_than_curried true left right

        let to_be_greater_or_equal_curried (should_be_greater_or_equal: bool) (left: compared_type) (right: compared_type): unit =
            if left >= right && should_be_greater_or_equal
            then
                let _ = Test.log ("+++ First value is greater or equal to second") in
                assert true
            else if left < right && not should_be_greater_or_equal
            then
                let _ = Test.log ("+++ First value is not greater to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of greater or equal failed") in
                assert false

        let to_be_greater_or_equal (left: compared_type) (right: compared_type): unit =
            to_be_greater_or_equal_curried true left right

        let to_be_less_or_equal_curried (should_be_less_or_equal: bool) (left: compared_type) (right: compared_type): unit =
            if left <= right && should_be_less_or_equal
            then
                let _ = Test.log ("+++ First value is less or equal to second") in
                assert true
            else if left > right && not should_be_less_or_equal
            then
                let _ = Test.log ("+++ First value is not less or equal to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of less or equal failed") in
                assert false

        let to_be_less_or_equal (left: compared_type) (right: compared_type): unit =
            to_be_less_or_equal_curried true left right

        let to_be_equal_curried (should_be_equal: bool) (left: compared_type) (right: compared_type): unit =
            if left = right && should_be_equal
            then
                let _ = Test.log ("+++ First value is equal to second") in
                assert true
            else if left <> right && not should_be_equal
            then
                let _ = Test.log ("+++ First value is not equal to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of equal failed") in
                assert false

        let to_be_equal (left: compared_type) (right: compared_type): unit =
            to_be_equal_curried true left right

        let to_be_greater_than_nat_curried (should_be_greater: bool) (left: compared_type) (right: nat): unit =
            if left > int (right) && should_be_greater
            then
                let _ = Test.log ("+++ First value is greater than second") in
                assert true
            else if left <= int (right) && not should_be_greater
            then
                let _ = Test.log ("+++ First value is not greater than second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of greater than failed") in
                assert false

        let to_be_greater_than_nat (left: compared_type) (right: nat): unit = 
                    to_be_greater_than_nat_curried true left right

        let to_be_less_than_nat_curried (should_be_less_than: bool) (left: compared_type) (right: nat): unit =
            if left < int (right) && should_be_less_than
            then
                let _ = Test.log ("+++ First value is less than second") in
                assert true
            else if left >= int (right) && not should_be_less_than
            then
                let _ = Test.log ("+++ First value is not less than second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of less than failed") in
                assert false

        let to_be_less_than_nat (left: compared_type) (right: nat): unit =
            to_be_less_than_nat_curried true left right

        let to_be_greater_or_equal_to_nat_curried (should_be_greater_or_equal: bool) (left: compared_type) (right: nat): unit =
            if left >= int (right) && should_be_greater_or_equal
            then
                let _ = Test.log ("+++ First value is greater or equal to second") in
                assert true
            else if left < int (right) && not should_be_greater_or_equal
            then
                let _ = Test.log ("+++ First value is not greater to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of greater or equal failed") in
                assert false

        let to_be_greater_or_equal_to_nat (left: compared_type) (right: nat): unit =
            to_be_greater_or_equal_to_nat_curried true left right

        let to_be_less_or_equal_to_nat_curried (should_be_less_or_equal: bool) (left: compared_type) (right: nat): unit =
            if left <= int (right) && should_be_less_or_equal
            then
                let _ = Test.log ("+++ First value is less or equal to second") in
                assert true
            else if left > int (right) && not should_be_less_or_equal
            then
                let _ = Test.log ("+++ First value is not less or equal to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of less or equal failed") in
                assert false

        let to_be_less_or_equal_to_nat (left: compared_type) (right: nat): unit =
            to_be_less_or_equal_to_nat_curried true left right

        let to_be_equal_to_nat_curried (should_be_equal: bool) (left: compared_type) (right: nat): unit =
            if left = int (right) && should_be_equal
            then
                let _ = Test.log ("+++ First value is equal to second") in
                assert true
            else if left <> int (right) && not should_be_equal
            then
                let _ = Test.log ("+++ First value is not equal to second") in
                assert true
            else
                let _ = Test.log ("--- Assertion of equal failed") in
                assert false

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