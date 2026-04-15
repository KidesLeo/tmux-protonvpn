# tmux-protonvpn

ProtonVPN status for your tmux status bar. Works with both the ProtonVPN CLI and GUI app (via NetworkManager).

## Install

### Via TPM

Add to `~/.tmux.conf`:

```tmux
set -g @plugin 'your-github-username/tmux-protonvpn'
```

Then press `prefix + I` to install.

### Manual

```bash
git clone https://github.com/your-github-username/tmux-protonvpn ~/.tmux/plugins/tmux-protonvpn
~/.tmux/plugins/tmux-protonvpn/tmux-protonvpn.tmux
```

## Usage

Add `#{protonvpn_status}` to your `status-right` or `status-left`:

```tmux
set -g status-right '#{protonvpn_status} | %H:%M'
```

For theme plugins that use their own prepend sections (e.g. rose-pine/tmux), use the script path directly:

```tmux
set -g @rose_pine_status_right_prepend_section '#(~/.tmux/plugins/tmux-protonvpn/scripts/vpn_status.sh)'
```

## Configuration

All options are optional — defaults are shown below.

```tmux
set -g @protonvpn_connected_icon    "🔐"   # icon when connected
set -g @protonvpn_disconnected_icon "ⓘ"  # icon when disconnected
set -g @protonvpn_disconnected_text "off"      # text appended when disconnected
set -g @protonvpn_show_server       "true"     # show server name when connected
set -g @protonvpn_show_protocol     "false"    # show protocol (WireGuard / OpenVPN)
set -g @protonvpn_show_load         "false"    # show server load % (CLI only)
```

**Note:** If you manually `set` an option to test it and then comment it out, tmux keeps the value in memory until the session restarts. To clear a stale option: `tmux set-option -gu @protonvpn_show_server`

## Requirements

- [ProtonVPN Linux CLI](https://protonvpn.com/support/linux-vpn-setup/) **or** NetworkManager (`nmcli`)
- tmux ≥ 2.1
