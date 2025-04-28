#!/bin/bash

source utils/colors.sh
source banner/banner.sh
source scripts/show_keys.sh
source scripts/generate_key.sh
source scripts/delete_key.sh
source scripts/remove_from_agent.sh

show_menu() {
    echo -e "${CYAN}"
    echo "=== SSH Key Manager ==="
    echo -e "${RESET}"
    echo "1) Show SSH keys"
    echo "2) Generate SSH key"
    echo "3) Delete SSH key"
    echo "4) Remove key from ssh-agent"
    echo "5) Exit"
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
            generate_key
            ;;
        3)
            delete_key
            ;;
        4)
            remove_from_agent
            ;;
        5)
            echo -e "${GREEN}Goodbye!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option. Try again.${RESET}"
            ;;
    esac

    echo
    echo -e "${CYAN}Press Enter to continue...${RESET}"
    read
done
