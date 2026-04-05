#! /bin/sh

## before we start...

echo -e '\n\e[1;91mWARNING!\e[1;97m This script assumes you have access to AUR (Arch User Repository). \e[0m\n\nYou can continue running this script if you have AUR helper installed (in this case, yay).\nIf not, exit the script and install AUR helper as follows: \n\n1. git clone https://aur.archlinux.org/yay.git \n2. cd yay \n3. makepkg -si \n\nAlso, bear in mind that script can install the apps you define in the last section. \n\e[1;97mIt might be a good idea to step back and examine the script if you have not done it yet.\e[0m\n\n'

while true; do
    read -p "Do you wish to continue running the script? (y/n) " yn
    case $yn in
        [yes]* )
            ## first of all, let's set some variables
            # graphical environment and basic utilities
            PS3='Please choose your video drivers: '
            options=("Intel" "AMD" "Nvidia" "QXL" "Abort")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Intel")
                        export graphics='xf86-video-intel' && break
                        ;;
                    "AMD")
                        export graphics='xf86-video-amdgpu' && break
                        ;;
                    "Nvidia")
                        export graphics='nvidia nvidia-utils' && break
                        ;;
                    "QXL")
                        export graphics='xf86-video-qxl' && break
                        ;;
                    "VMWare")
                        export graphics='xf86-video-vmware' && break
                        ;;
                    "Abort")
                        echo -e '\e[1;31mInstallation aborted.' ; exit
                        ;;
                    *) echo "Option invalid.";;
                esac
            done
			
			# basic utilities
			export basic='zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship foot eza bat mangowm waybar awww rofi dunst pulsemixer polkit-gnome ly swaylock pipewire pipewire-pulse pipewire-alsa alsa-utils pipewire-jack upower'

			# basic apps
			export apps='imv feh zathura zathura-pdf-mupdf ranger-git python-pillow fastfetch mpv gvim timeshift timeshift-autosnap grim slurp nwg-look htop w3m wev'

			# eye-candy
			export rice='ttf-iosevkaterm-nerd ttf-noto-emoji-monochrome dark-icon-theme-git terminus-font flat-remix-gtk fortune-mod noto-fonts-cjk'

			# user-defined apps – EXAMINE THAT PART THOROUGHLY BEFORE RUNNING THE SCRIPT
			export user='brave-bin android-tools libreoffice-fresh libqalculate spotify-player newsboat redshift wl-sunset wayland-utils mp3gain ffmpeg wf-recorder gimp mpc mpd ncmpcpp playerctl syncthing'
			
			if [[ ! -e /usr/bin/reflector && ! -e /usr/bin/paccache ]]; then
				sudo pacman -S --noconfirm reflector pacman-contrib
			fi

			sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
            
            ## let's set up Chaotic-AUR
            # We start by retrieving the primary key to enable the installation of our keyring and mirror list.
            sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
            sudo pacman-key --lsign-key 3056513887B78AEB

            # This allows us to install our chaotic-keyring and chaotic-mirrorlist packages.
            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
            sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

            # Then, we append (adding at the end) the following to /etc/pacman.conf:
            sudo sed -i -e '$a\\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf
 
            # We recommend running a full system update along syncing our mirrorlist.
            sudo pacman -Syu rate-mirrors yay

            ## now, let's install!
            echo -e '\n\e[1;96mInstalling graphical environment and basic utilities...'
            yay -S --noconfirm $graphics $basic $apps $rice $user
			sudo fc-cache -fv

			# let's turn on some services
            sudo systemctl enable ly@tty2.service
            sudo systemctl enable ufw.service
			sudo ufw enable
			chsh -s $(which zsh)

			## now, let's rice!
			cp -rv .config ~
			cp -rv .local ~
			cp -rv .vim ~
			cp -rv scripts ~/Scripts
			cp -rv wallpapers ~/Wallpapers
			sudo cp -rv usr /
			sudo cp -rv etc /
			
			for i in .bashrc .vimrc .viminfo
			    do
			        cp -rfv $i ~/$i
			    done
			
			echo -e '\e[1;32mThe ricing has completed. \e[1;97mYou can reboot now. Have fun using your system!\e[0m'
            ;;
        [no]* ) echo -e '\e[1;91mInstallation aborted.' ; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
