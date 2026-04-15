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

## Configuration

Defaults are shown below.

```tmux
set -g @protonvpn_connected_icon    "🔐"   # icon when connected
set -g @protonvpn_disconnected_icon "ⓘ"  # icon when disconnected
set -g @protonvpn_disconnected_text "off"      # text appended when disconnected
set -g @protonvpn_show_server       "true"     # show server name when connected
set -g @protonvpn_show_protocol     "false"    # show protocol (WireGuard / OpenVPN)
set -g @protonvpn_show_load         "false"    # show server load % (CLI only)
```

## Requirements

- [ProtonVPN Linux CLI](https://protonvpn.com/support/linux-vpn-setup/) **or** NetworkManager (`nmcli`)
- tmux ≥ 2.1
