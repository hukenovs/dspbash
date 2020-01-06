#!/bin/bash
#
# ########################################################################## #
#
# Title       : init_ubuntu.sh
# Author      : Kapitanov Alexander
# E-mail      : sallador@bk.ru
# Date        : 2017/06/13
#
# Description : 
#   Init ubuntu w/ useful packages and software after installation
#
# Steps:
#   0: Disable swap permanently
#   1: Install snap, wine, git, mc, make, curl, gcc, etc.
#   2: Install software: gparted, pdf reader, qbittorrent
#   3: Install Docker & Sublime-text
#   4: Install Pycharm Community
#   5: Install Slack, Telegram
#   6: Install Libre Office
#   7: Install GNU Octave
#   8: Install Python, pip, virtualenv and some packages
# 
#
# ########################################################################## #


echo -e "\n[INFO]: Disable swap...\n"
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
# or
# sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab


echo -e "\n\n[INFO]: install snap, git, mc, make, gcc etc.\n"
sudo apt install -y snapd \
                    htop \
                    git \
                    mc \
                    autoconf \
                    make \
                    curl \
                    wget \
                    gcc gcc-6 g++ g++-6 \
                    net-tools traceroute \
                    apt-transport-https \
                    ca-certificates \
                    gnupg-agent \
                    software-properties-common #\
                    # wine-stable

wait
echo -e "\n\n[INFO]: install PDF reader, torrent, etc.\n"
sudo apt install -y gparted \
                    evince \
                    qbittorrent \
                    pinta gimp \
                    gnome-tweak-tool \
                    vlc \

wait
echo -e "\n\n[INFO]: install Docker\n"
sudo apt remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo -e "\n\n[INFO]: install Sublime text 3\n"
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable"

sudo add-apt-repository \
    "deb https://download.sublimetext.com/ apt/stable/"

sudo apt update && sudo apt install sublime-text \
                                    docker-ce docker-ce-cli containerd.io


# Add Docker group for use it without sudo
# Show docker group
cat /etc/group | grep "docker"
# Create the docker group if it doesn't exist
sudo groupadd docker
# Add trusted users to the docker group.
sudo usermod -aG docker $USER
# Log out and log back.


echo -e "\n\n[INFO]: Install PyCharm, GNU Octave, Slack, Telegram etc.\n"
sudo snap install pycharm-community --classic
sudo snap install slack --classic
sudo snap install octave --beta
sudo snap install telegram-desktop \
                  libreoffice


# Leave this part for history...
# echo "[INFO]: install PyCharm Community"
# sudo snap install pycharm-community --classic

# echo "[INFO]: install Slack"
# sudo snap install slack --classic

# echo "[INFO]: install Telegram"
# # wget -O- https://telegram.org/dl/desktop/linux | sudo tar xJ -C /opt/
# # sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop
# # or
# sudo snap install telegram-desktop


# echo "[INFO]: install Libre Office"
# # sudo add-apt-repository ppa:libreoffice/ppa
# #sudo apt-get update && sudo apt install -y libreoffice
# sudo snap install libreoffice


# echo "[INFO]: install GNU Octave"
# sudo snap install octave --beta
# # or
# # sudo apt install flatpak
# # flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# # flatpak install flathub org.octave.Octave
# # # flatpak install flathub org.octave.Octave
# # # sudo apt remove flatpak


echo -e "\n\n[INFO]: Install Python, pip, virtualenv, jupyter...\n"
sudo apt install python-pip         python2.7           \
                 python3-pip        python3             \
                 cython             cython3             \
                 python-ipython     python3-ipython     \
                 ipython            ipython3            \
                 python-virtualenv  python3-virtualenv  \
                 virtualenv \
                 jupyter


echo -e "\n\n[INFO]: Autoremove all...\n"
wait
sudo apt autoremove -y