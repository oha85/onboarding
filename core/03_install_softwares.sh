echo "Package update and upgrade starts. Please enter sudo password."
read -p "Please confirm by pushing [Y] button to start updating and upgrading packages before  " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
   sudo apt autoremove && sudo apt autoclean
   sudo apt update && sudo apt upgrade
fi

#Last git version was 2.43.0 
sudo apt-get remove --auto-remove git
sudo apt-get purge --auto-remove git
sudo apt install git
git --version
read -p "Press key to continue..." -n1 -s

#Last vsCode version was 1.108.2
sudo apt-get remove --auto-remove code 
sudo apt-get purge --auto-remove code 
sudo snap install --classic code
code --version
read -p "Press key to continue..." -n1 -s

