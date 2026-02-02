echo "Package update and upgrade starts. Please enter sudo password."
read -p "Please confirm by pushing [Y] button to start updating and upgrading packages before  " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
   sudo apt autoremove && sudo apt autoclean
   sudo apt update && sudo apt upgrade
fi

