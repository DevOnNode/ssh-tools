#!/bin/bash

source utils/colors.sh
source banner/banner.sh
source scripts/show_keys.sh
source scripts/generate_key.sh
source scripts/delete_key.sh
source scripts/remove_from_agent.sh
source scripts/list_agent_keys.sh


show_menu() {
    echo -e "${CYAN}"
    echo "=== SSH Key Manager ==="
    echo -e "${RESET}"
    echo "1) Show SSH keys"
    echo "2) List keys loaded in ssh-agent"
    echo "3) Generate SSH key"
    echo "4) Delete SSH key"
    echo "5) Remove key from ssh-agent"
    echo "6) Exit"
    echo -e "${CYAN}"
}

while true; do
    clear
    show_banner
    show_menu
    echo
    echo -e "${YELLOW}Enter your choice:${RESET}"
    read choice

    case $choice in
        1)
            show_keys
            ;;
        2)
            list_agent_keys
            ;;
        3)
            generate_key
            ;;
        4)
            delete_key
            ;;
        5)
            remove_from_agent
            ;;
        6)
            echo -e "${GREEN}Goodbye!${RESET}"
            exit 0
            ;;
    esac

    echo
    echo -e "${CYAN}Press Enter to continue...${RESET}"
    read
done
