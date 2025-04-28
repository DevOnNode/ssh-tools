#!/bin/bash

source ./utils/colors.sh
source ./banner/banner.sh
source ./scripts/show_keys.sh
source ./scripts/generate_key.sh
source ./scripts/delete_key.sh
source ./scripts/remove_from_agent.sh

show_banner

echo -e "${GREEN}Welcome to the SSH Key Management Tool!${RESET}"
echo -e "${CYAN}Choose an option:${RESET}"
echo "1. Show SSH keys"
echo "2. Generate new SSH key"
echo "3. Delete SSH key"
echo "4. Remove SSH key from ssh-agent"
echo "5. Exit"
read choice

case $choice in
    1) show_keys ;;
    2) generate_key ;;
    3) delete_key ;;
    4) remove_from_agent ;;
    5) exit 0 ;;
    *) echo -e "${RED}❗ Invalid choice.${RESET}" ;;
esac
echo -e "${GREEN}✅ Operation completed!${RESET}"