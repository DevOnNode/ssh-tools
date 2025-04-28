#!/bin/bash

source utils/progress_bar.sh

generate_key() {
    echo
    echo -e "${YELLOW}📧 Enter your email:${RESET}"
    read user_email

    echo
    echo -e "${YELLOW}🔑 Choose key type (ed25519/rsa):${RESET}"
    read key_type

    case "$key_type" in
        ed25519|ED25519|"")
            key_type="ed25519"
            ;;
        rsa|RSA)
            key_type="rsa"
            ;;
        *)
            echo -e "${RED}❗ Invalid key type selected.${RESET}"
            printf '\a'
            return
            ;;
    esac

    key_path="$HOME/.ssh/id_${key_type}"

    if [[ -f "$key_path" || -f "${key_path}.pub" ]]; then
        echo -e "${RED}❗ SSH key already exists at ${key_path}.${RESET}"
        printf '\a'
        return
    fi

    echo
    echo -e "${CYAN}🔑 Generating SSH key...${RESET}"

    show_progress_bar

    if [[ "$key_type" == "rsa" ]]; then
        ssh-keygen -t rsa -b 4096 -C "$user_email" -f "$key_path" -N ""
    else
        ssh-keygen -t ed25519 -C "$user_email" -f "$key_path" -N ""
    fi

    eval "$(ssh-agent -s)"

    echo -e "${CYAN}➕ Adding SSH key to the agent...${RESET}"
    ssh-add "$key_path"

    echo
    echo -e "${GREEN}🎉 SSH Key successfully created and added!${RESET}"
    echo -e "${BOLD}Key locations:${RESET}"
    echo -e " - 🔐 Private key: ${BLUE}${key_path}${RESET}"
    echo -e " - 🔓 Public key: ${BLUE}${key_path}.pub${RESET}"
    printf '\a'
}