#!/usr/bin/env bash
#
# Generate PIN codes from letters using phone keypad layout
#
#/ Usage:
#/   ./pinkey.sh <string>
#/   OR
#/   ./pinkey.sh
#/   Enter letter(s): <string>

set -e
set -u

main() {
    local pin="" string="${1:-}" char num

    [[ -z "${string:-}" ]] && read -rsp "Enter letter(s): " string && echo

    for l in $(seq 1 ${#string}); do
        num=""
        char="${string:l-1:1}"
        [[ "$char" =~ [0-9] ]] && num="$char"
        [[ "wxyz" == *"${char,,}"* ]] && num="9"
        [[ "tuv" == *"${char,,}"* ]]  && num="8"
        [[ "pqrs" == *"${char,,}"* ]] && num="7"
        [[ "mno" == *"${char,,}"* ]]  && num="6"
        [[ "jkl" == *"${char,,}"* ]]  && num="5"
        [[ "ghi" == *"${char,,}"* ]]  && num="4"
        [[ "def" == *"${char,,}"* ]]  && num="3"
        [[ "abc" == *"${char,,}"* ]]  && num="2"
        [[ "+" == "$char" ]]          && num="0"
        [[ -z "$num" ]]               && num="1"
        pin+="$num"
    done

    echo "$pin"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
