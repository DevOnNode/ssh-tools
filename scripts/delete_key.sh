#!/bin/bash

delete_key() {
    echo -e "${YELLOW}📂 Enter the path to the SSH key you want to delete (e.g., id_ed25519):${RESET}"
    read key_name

    key_path="$HOME/.ssh/$key_name"
    pub_key_path="$key_path.pub"

    if [[ ! -f "$key_path" && ! -f "$pub_key_path" ]]; then
        echo -e "${RED}❗ No SSH key found at ${key_path} or ${pub_key_path}.${RESET}"
        return
    fi

    echo -e "${CYAN}⚠️ Are you sure you want to delete the following SSH key?${RESET}"
    echo -e " - 🔐 Private key: ${BLUE}${key_path}${RESET}"
    echo -e " - 🔓 Public key: ${BLUE}${pub_key_path}${RESET}"
    echo -e "${YELLOW}Type 'yes' to confirm or 'no' to cancel:${RESET}"
    read confirmation

    if [[ "$confirmation" != "yes" ]]; then
        echo -e "${GREEN}✅ Key deletion canceled.${RESET}"
        return
    fi

    rm -f "$key_path" "$pub_key_path"

    echo -e "${GREEN}🎉 SSH key(s) successfully deleted!${RESET}"
    printf '\a'
}