#!/bin/bash

show_keys() {
    if [[ ! -d ~/.ssh ]]; then
        echo -e "${RED}❗ No .ssh directory found.${RESET}"
        return
    fi

    echo -e "${CYAN}\n🔍 Searching for existing SSH keys...${RESET}"
    private_keys=$(find ~/.ssh -type f \( -name "id_*" ! -name "*.pub" \) 2>/dev/null)
    public_keys=$(find ~/.ssh -type f -name "*.pub" 2>/dev/null)
    separator="------------------------------------------------------------"

    if [[ -z "$private_keys" && -z "$public_keys" ]]; then
        echo -e "${RED}❗ No SSH keys found.${RESET}"
        printf '\a'
        return
    fi

    if [[ -n "$private_keys" ]]; then
        echo
        echo -e "${GREEN}🔐 Private Keys:${RESET}"
        for key in $private_keys; do
            echo -e "${YELLOW}➡️ Path: ${key}${RESET}"
            echo -e "${BLUE}${separator}${RESET}"
            cat "$key"
            echo
            echo -e "${BLUE}${separator}${RESET}"
        done
    fi

    if [[ -n "$public_keys" ]]; then
        echo
        echo -e "${GREEN}🔓 Public Keys:${RESET}"
        for key in $public_keys; do
            echo -e "${YELLOW}➡️ Path: ${key}${RESET}"
            echo -e "${BLUE}${separator}${RESET}"
            cat "$key"
            echo
            echo -e "${BLUE}${separator}${RESET}"
        done
    fi

    echo
    echo -e "${GREEN}✅ SSH key(s) displayed successfully!${RESET}"
    printf '\a'
}