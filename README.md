
---

# SSH Key Manager

A small modular set of scripts for managing SSH keys.

## Scripts

- `main.sh` — launcher with menu.
- `scripts/show_keys.sh` — finds and displays SSH keys.
- `scripts/generate_key.sh` — generates a new SSH key.

## How to Use

1. Make all scripts executable:
   ```bash
   chmod +x main.sh scripts/*.sh utils/*.sh banner/*.sh
   ```

2. Run the manager:
   ```bash
   ./main.sh
   ```

## Requirements

- Linux (designed for bash)
- Installed utilities:
  - `ssh-keygen`
  - `ssh-agent`
  - `ssh-add`
- (Optional) `xclip` or `wl-clipboard` for copying the key to clipboard

---