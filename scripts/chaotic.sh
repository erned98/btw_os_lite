#! /bin/bash

# We start by retrieving the primary key to enable the installation of our keyring and mirror list.
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

# This allows us to install our chaotic-keyring and chaotic-mirrorlist packages.
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Then, we append (adding at the end) the following to /etc/pacman.conf:
sudo sed -i -e '$a\\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf

# We recommend running a full system update along syncing our mirrorlist.
sudo pacman -Syu rate-mirrors

exit
