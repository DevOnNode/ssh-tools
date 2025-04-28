#!/bin/bash
 
 RED="\e[31m"
 GREEN="\e[32m"
 BLUE="\e[34m"
 YELLOW="\e[33m"
 CYAN="\e[36m"
 RESET="\e[0m"
 BOLD="\e[1m"
 
 echo -e "${CYAN}🔍 Searching for existing SSH keys...${RESET}"
 echo -en "${CYAN}🔍 Searching for existing SSH keys"
 for i in {1..3}; do
     echo -n "."
     sleep 0.5
 done
 echo -e "${RESET}"
 
 private_keys=$(find ~/.ssh -type f \( -name "id_*" ! -name "*.pub" \) 2>/dev/null)
 public_keys=$(find ~/.ssh -type f -name "*.pub" 2>/dev/null)
 
 if [[ -z "$private_keys" && -z "$public_keys" ]]; then
     echo -e "${RED}❗ No SSH keys found.${RESET}"
     exit 0
 fi
 
 separator="------------------------------------------------------------"
 
 if [[ -n "$private_keys" ]]; then
     echo
     echo -e "${BOLD}${GREEN}🔐 Private Keys:${RESET}"
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
     echo -e "${BOLD}${GREEN}🔓 Public Keys:${RESET}"
     for key in $public_keys; do
         echo -e "${YELLOW}➡️ Path: ${key}${RESET}"
         echo -e "${BLUE}${separator}${RESET}"
         cat "$key"
         echo
         echo -e "${BLUE}${separator}${RESET}"
     done
 fi
 
 echo