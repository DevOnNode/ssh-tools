#!/bin/bash
 
 echo "Enter your email:"
 RED="\e[31m"
 GREEN="\e[32m"
 BLUE="\e[34m"
 YELLOW="\e[33m"
 CYAN="\e[36m"
 RESET="\e[0m"
 BOLD="\e[1m"
 
 echo -e "${CYAN}🛠️  SSH Key Generator${RESET}"
 echo
 echo -e "${YELLOW}📧 Enter your email:${RESET}"
 read user_email
 
 key_path="$HOME/.ssh/id_ed25519"
 
 echo
 echo -e "${CYAN}🔑 Generating SSH key...${RESET}"
 ssh-keygen -t ed25519 -C "$user_email" -f "$key_path" -N ""
 
 eval "$(ssh-agent -s)"
 
 echo -e "${CYAN}➕ Adding SSH key to the agent...${RESET}"
 ssh-add "$key_path"
 
 echo
 echo "✅ New SSH key successfully created."
 echo "Key locations:"
 echo " - Private key: $key_path"
 echo " - Public key: ${key_path}.pub"
 echo -e "${GREEN}✅ New SSH key successfully created.${RESET}"
 echo -e "${BOLD}Key locations:${RESET}"
 echo -e " - 🔐 Private key: ${BLUE}${key_path}${RESET}"
 echo -e " - 🔓 Public key: ${BLUE}${key_path}.pub${RESET}"
 echo