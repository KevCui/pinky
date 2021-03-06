#!/usr/bin/env bash
#
# Generate PIN codes from letters using phone keypad layout
#
#/ Usage:
#/   ./pinky.sh <letters>
#/   OR
#/   ./pinky.sh
#/   Enter letter(s): <letters>

set -e
set -u

main() {
    local pin="" letters="${1:-}" char num

    [[ -z "${letters:-}" ]] && read -rsp "Enter letter(s): " letters && echo

    for l in $(seq 1 ${#letters}); do
        num=""
        char="${letters:l-1:1}"
        [[ "$char" =~ [0-9] ]] && num="$char"
        [[ "wxyz" == *"${char,,}"* ]] && num="9"
        [[ "tuv"  == *"${char,,}"* ]] && num="8"
        [[ "pqrs" == *"${char,,}"* ]] && num="7"
        [[ "mno"  == *"${char,,}"* ]] && num="6"
        [[ "jkl"  == *"${char,,}"* ]] && num="5"
        [[ "ghi"  == *"${char,,}"* ]] && num="4"
        [[ "def"  == *"${char,,}"* ]] && num="3"
        [[ "abc"  == *"${char,,}"* ]] && num="2"
        [[ "+" == "$char" ]]          && num="0"
        [[ -z "$num" ]]               && num="1"
        pin+="$num"
    done

    echo "$pin"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
