#!/bin/bash
 
 echo "Enter your email:"
 read user_email
 
 key_path="$HOME/.ssh/id_ed25519"
 
 ssh-keygen -t ed25519 -C "$user_email" -f "$key_path" -N ""
 
 eval "$(ssh-agent -s)"
 
 ssh-add "$key_path"
 
 echo
 echo "✅ New SSH key successfully created."
 echo "Key locations:"
 echo " - Private key: $key_path"
 echo " - Public key: ${key_path}.pub"