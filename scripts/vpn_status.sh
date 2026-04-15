#!/usr/bin/env bash

get_opt() {
    local opt="$1" default="$2"
    val=$(tmux show-option -gqv "$opt" 2>/dev/null)
    echo "${val:-$default}"
}

connected_icon=$(get_opt    "@protonvpn_connected_icon"    "🔐")
disconnected_icon=$(get_opt "@protonvpn_disconnected_icon" "ⓘ")
disconnected_text=$(get_opt "@protonvpn_disconnected_text" "VPN OFF")
show_server=$(get_opt       "@protonvpn_show_server"       "true")
show_protocol=$(get_opt     "@protonvpn_show_protocol"     "false")
show_load=$(get_opt         "@protonvpn_show_load"         "false")

output=$(protonvpn status 2>/dev/null)
vpn_status=$(echo "$output" | grep "^Status:" | awk '{print $2}')

if [ "$vpn_status" = "Connected" ]; then
    parts="$connected_icon"

    if [ "$show_server" = "true" ]; then
        server=$(echo "$output" | grep "^Server:" | sed 's/^Server: //')
        parts="$parts $server"
    fi

    if [ "$show_protocol" = "true" ]; then
        proto=$(echo "$output" | grep "^Protocol:" | awk '{print $2}')
        parts="$parts ($proto)"
    fi

    if [ "$show_load" = "true" ]; then
        load=$(echo "$output" | grep "^Load:" | awk '{print $2}')
        parts="$parts load:$load"
    fi

    echo "$parts"
    exit 0
fi

# nmcli (connected via GUI app)
nm_line=$(nmcli -t -f NAME,TYPE connection show --active 2>/dev/null | grep "^ProtonVPN")

if [ -n "$nm_line" ]; then
    parts="$connected_icon"

    if [ "$show_server" = "true" ]; then
        conn_name=$(echo "$nm_line" | cut -d: -f1)
        server="${conn_name#ProtonVPN }"
        parts="$parts $server"
    fi

    if [ "$show_protocol" = "true" ]; then
        proto=$(echo "$nm_line" | cut -d: -f2)
        parts="$parts ($proto)"
    fi

    echo "$parts"
    exit 0
fi

echo "$disconnected_icon $disconnected_text"
