#!/bin/bash

generate_key() {
    echo
    echo -e "${YELLOW}📧 Enter your email:${RESET}"
    read user_email

    key_path="$HOME/.ssh/id_ed25519"

    if [[ -f "$key_path" || -f "${key_path}.pub" ]]; then
        echo -e "${RED}❗ SSH key already exists at ${key_path}.${RESET}"
        printf '\a'
        return
    fi

    echo
    echo -e "${CYAN}🔑 Generating SSH key...${RESET}"

    bar="■□□□□□□□□□"
    for i in {1..10}; do
        printf "\r${BLUE}[%-10s] %d%%${RESET}" "$bar" "$((i * 10))"
        bar=${bar/□/■}
        sleep 0.2
    done
    echo

    ssh-keygen -t ed25519 -C "$user_email" -f "$key_path" -N "" -q

    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        echo -e "${RED}❗ ssh-agent is not running. Starting it...${RESET}"
        eval "$(ssh-agent -s)"
    fi

    echo -e "${CYAN}➕ Adding SSH key to the agent...${RESET}"
    ssh-add "$key_path"

    echo
    echo -e "${GREEN}🎉 SSH Key successfully created and added!${RESET}"
    echo -e "${BOLD}Key locations:${RESET}"
    echo -e " - 🔐 Private key: ${BLUE}${key_path}${RESET}"
    echo -e " - 🔓 Public key: ${BLUE}${key_path}.pub${RESET}"
    printf '\a'
}