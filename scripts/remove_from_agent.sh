#!/bin/bash

remove_from_agent() {
    echo -e "${YELLOW}📂 Enter the name of the SSH key you want to remove from the agent (e.g., id_ed25519):${RESET}"
    read key_name

    key_path="$HOME/.ssh/$key_name"

    ssh_key_in_agent=$(ssh-add -l | grep "$key_name")

    if [[ -z "$ssh_key_in_agent" ]]; then
        echo -e "${RED}❗ SSH key ${key_name} is not added to the agent.${RESET}"
        return
    fi

    ssh-add -d "$key_path"

    echo -e "${GREEN}🎉 SSH key ${key_name} successfully removed from the agent!${RESET}"
    printf '\a'
}