#!/usr/bin/env bash
PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT="$PLUGIN_DIR/scripts/vpn_status.sh"

_interpolate() {
    local val="$1"
    echo "${val/\#\{protonvpn_status\}/#($SCRIPT)}"
}

_update_option() {
    local opt="$1"
    local current new
    current=$(tmux show-option -gqv "$opt")
    new="$(_interpolate "$current")"
    [ "$current" != "$new" ] && tmux set-option -gq "$opt" "$new"
}

chmod +x "$SCRIPT"
_update_option "status-right"
_update_option "status-left"
