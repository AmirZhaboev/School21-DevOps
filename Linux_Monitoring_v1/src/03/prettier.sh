#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Error. Need 4 parameters"
    exit 1
fi

NAME_BACKGROUND=$1
NAME_FONT=$2
VALUE_BACKGROUND=$3
VALUE_FONT=$4

BG_COLORS=(
    "\033[47m"
    "\033[41m"
    "\033[42m"
    "\033[44m"
    "\033[45m"
    "\033[40m"
)

FONT_COLORS=(
    "\e[37m"
    "\e[31m"
    "\e[32m"
    "\e[34m"
    "\e[35m"
    "\e[30m"
)

REGEX="^[1-6]$"

if ! [[ "$NAME_BACKGROUND" =~ $RE ]] || ! [[ "$NAME_FONT" =~ $RE ]] || ! [[ "$VALUE_BACKGROUND" =~ $RE ]] || ! [[ "$VALUE_FONT" =~ $RE ]]; then
    echo "Error. Parameters should be between 1-6"
    exit 1
fi

if [ "$NAME_BACKGROUND" -eq "$NAME_FONT" ] || [ "$VALUE_BACKGROUND" -eq "$VALUE_FONT" ]; then
    echo "Error. Background color and font color can not be the same."
    exit 1
fi

NAME_BACKGROUND=$(( NAME_BACKGROUND - 1 ))
NAME_FONT=$(( NAME_FONT - 1 ))
VALUE_BACKGROUND=$(( VALUE_BACKGROUND - 1 ))
VALUE_FONT=$(( VALUE_FONT - 1 ))

print_line() {
    local name="$1"
    local value="$2"
    
    local NAME_COLOR="${BG_COLORS[$NAME_BACKGROUND]}${FONT_COLORS[$NAME_FONT]}"
    local VALUE_COLOR="${BG_COLORS[$VALUE_BACKGROUND]}${FONT_COLORS[$VALUE_FONT]}"
    local COLOR_RESET="\033[0m"

    echo -e "${NAME_COLOR}$name${COLOR_RESET} = ${VALUE_COLOR}$value${COLOR_RESET}"
}

print_line "HOSTNAME" "$HOSTNAME"
print_line "TIMEZONE" "$TIMEZONE"
print_line "USER" "$USER"
print_line "OS" "$OS"
print_line "DATE" "$DATE"
print_line "UPTIME" "$UPTIME"
print_line "UPTIME_SEC" "$UPTIME_SEC"
print_line "IP" "$IP"
print_line "MASK" "$MASK"
print_line "GATEWAY" "$GATEWAY"
print_line "RAM_TOTAL" "$RAM_TOTAL"
print_line "RAM_USED" "$RAM_USED"
print_line "RAM_FREE" "$RAM_FREE"
print_line "SPACE_ROOT" "$SPACE_ROOT"
print_line "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
print_line "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"