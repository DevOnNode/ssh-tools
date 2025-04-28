#!/bin/bash

source ./utils/colors.sh
source ./banner/banner.sh
source ./scripts/show_keys.sh
source ./scripts/generate_key.sh

show_banner

echo -e "${CYAN}Choose an option:${RESET}"
echo "1. Show SSH keys"
echo "2. Generate new SSH key"
echo "3. Exit"
read choice

case $choice in
    1) show_keys ;;
    2) generate_key ;;
    3) exit 0 ;;
    *) echo -e "${RED}❗ Invalid choice.${RESET}" ;;
esac