#!/bin/bash

# NR>1 tells awk to skip the header information
# Since each line consists of a username and a password, $2 stores the password and is used for testing.
# Since the delimiter in the txt file is a space, there isn't a need to change the FS of awk
# awk built-in function length() is used to test for the length of the password
# regex is used to test for the presence of at least 1 number and at least 1 capital letter in the password
# Since the password must have all 3 conditions in order to pass, the AND operator is used
# A 'if' control stucture is used to control the logic flow: true will print the 'meet requirements' statement, false will print the 'does NOT meet requirements' statement

awk 'NR>1 { if ( length($2) >= 8 && $2 ~ /[A-Z]+/ && $2 ~ /[0-9]+/ )
                {
                    printf "%s - meets password strength requirements\n", $2;
                }
            else
                {
                    printf "%s - does NOT meet password strength requirements\n", $2;
                }
}' usrpwords.txt

exit 0
