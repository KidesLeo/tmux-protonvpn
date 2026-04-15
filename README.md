# tmux-protonvpn

ProtonVPN status for your tmux status bar. Works with both the ProtonVPN CLI and GUI app (via NetworkManager).

<img width="404" height="76" alt="VPN OFF" src="https://github.com/user-attachments/assets/707af345-c5b4-4ba2-b6c7-900043cf4bf5" />
<img width="637" height="62" alt="VPN Server Location" src="https://github.com/user-attachments/assets/89cdab57-1bbe-4388-b651-419a027c0640" />

## Install

### Via TPM

Add to `~/.tmux.conf`:

```tmux
set -g @plugin 'KidesLeo/tmux-protonvpn'
```

Then press `prefix + I` to install.

### Manual

```bash
git clone https://github.com/KidesLeo/tmux-protonvpn ~/.tmux/plugins/tmux-protonvpn
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
