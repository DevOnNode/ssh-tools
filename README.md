
 ---
 
 # SSH Key Manager
 
 A small set of scripts for managing SSH keys.
 
 ## Scripts
 
 - `show_ssh_keys.sh` — finds and displays private and public SSH keys in `~/.ssh`.
 - `generate_ssh_key.sh` — generates a new SSH key.
 
 ## How to Use
 
 1. Make the scripts executable:
    ```bash
    chmod +x show_ssh_keys.sh generate_ssh_key.sh
    ```
 
 2. Display existing keys:
    ```bash
    ./show_ssh_keys.sh
    ```
 
 3. Generate a new SSH key:
    ```bash
    ./generate_ssh_key.sh
    ```
 
 ## Requirements
 
 - Linux (designed for bash)
 - Installed utilities:
   - `ssh-keygen`
   - `ssh-agent`
   - `ssh-add`
 - (Optional) `xclip` or `wl-clipboard` for copying the key to clipboard
 
 ---