#!/bin/bash

list_agent_keys() {
    echo
    echo -e "${CYAN}🔍 Checking SSH keys loaded in the agent...${RESET}"
    if ssh-add -l 2>&1 | grep -q "The agent has no identities."; then
        echo -e "${RED}❗ No SSH keys loaded in ssh-agent.${RESET}"
        printf '\a'
    else
        ssh-add -l
        echo -e "${GREEN}✅ SSH keys listed successfully!${RESET}"
    fi
}
