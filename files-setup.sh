#!/bin/bash -x

# this is the dotfiles and other tweaks that are used by the dev environment, not software per se
# and also some tidying up of directories including the home directory for the dev user

devusername=$1
home=$2

useradd -u 1000 ${devusername}
mkdir -p /usr/share/fonts/truetype /usr/share/fonts/freefont ${home}/${devusername}/.ssh ${home}/${devusername}/.config/Yubico/u2f_keys ${home}/${devusername}/.config/alacritty ${home}/${devusername}/.wireguard ${home}/${devusername}/.config/i3 /usr/share/applications /usr/share/gnome-session/sessions /usr/share/xsessions /etc/openvpn ${home}/${devusername}/.vim/autoload ${home}/${devusername}/.vim/after/ftplugin /etc/ssh/ ${home}/${devusername}/.config/kitty
cp files/resources/selinux-config /etc/selinux/config
cp files/resources/noxisttf16.ttf /usr/share/fonts/truetype/freefont/noxisttf16.ttf
cp files/resources/Interface-Regular.ttf /usr/share/fonts/truetype/freefont/Interface-Regular.ttf
cp files/resources/Interface-Medium.ttf /usr/share/fonts/truetype/freefont/Interface-Medium.ttf
cp files/resources/expressway_rg-webfont.ttf /usr/share/fonts/truetype/freefont/expressway_rg-webfont.ttf
cp files/resources/iosevka-term-ss08-regular.ttf /usr/share/fonts/truetype/freefont/iosevka-term-ss08-regular.ttf
cp files/resources/iosevka-term-ss08-medium.ttf /usr/share/fonts/truetype/freefont/iosevka-term-ss08-medium.ttf
cp files/resources/config ${home}/${devusername}/.ssh/config
cp files/resources/authorized_keys ${home}/${devusername}/.ssh/authorized_keys
cp files/resources/bashrc ${home}/${devusername}/.bashrc
cp files/resources/Xresources ${home}/${devusername}/.Xresources
cp files/resources/bashrc /root/.bashrc
cp files/resources/zshrc ${home}/${devusername}/.zshrc
cp files/resources/tmux.conf ${home}/${devusername}/.tmux.conf
cp files/resources/tmux-yank.sh ${home}/${devusername}/.tmux.yank.sh
cp files/resources/u2f_keys ${home}/${devusername}/.config/Yubico/u2f_keys
cp files/resources/alacritty.yml ${home}/${devusername}/.config/alacritty
cp files/resources/up.sh ${home}/${devusername}/.wireguard/up.sh
cp files/resources/i3-config ${home}/${devusername}/.config/i3/config
cp files/resources/i3status.conf ${home}/${devusername}/.i3status.conf
cp files/resources/pathogen.vim ${home}/${devusername}/.vim/autoload/pathogen.vim
cp files/resources/ftplugin-python.vim ${home}/${devusername}/.vim/after/ftplugin/python.vim
cp files/resources/.dircolors ${home}/${devusername}/.dircolors
cp files/resources/git-completion.bash /etc/git-completion.bash
cp files/resources/gitconfig ${home}/${devusername}/.gitconfig
cp files/resources/xprofile ${home}/${devusername}/.xprofile
cp files/resources/vimrc ${home}/${devusername}/.vimrc
cp files/resources/git-prompt.sh /etc/git-prompt.sh
cp files/resources/lein /usr/local/bin/lein
cp files/resources/startsway /usr/local/bin/startsway
cp files/resources/keychain /usr/bin/keychain 
cp files/resources/ds /usr/bin/ds 
cp files/resources/dsx /usr/bin/dsx 
cp files/resources/chromeinstall.sh /tmp/chromeinstall.sh
cp files/resources/sshd_config /etc/ssh/sshd_config
cp files/resources/kitty.conf ${home}/${devusername}/.config/kitty/kitty.conf
cp files/resources/citrix /usr/local/bin/citrix
cp files/resources/gg /usr/local/bin/gg

chown -R ${devusername}:${devusername} ${home}/${devusername} && chmod 600 ${home}/${devusername}/.ssh/config /etc/ssh/sshd_config ${home}/${devusername}/.ssh/authorized_keys && chmod 555 ${home}/${devusername}/.bashrc /etc/git-prompt.sh /usr/local/bin/lein /usr/local/bin/gg /tmp/viminstall.sh /tmp/chromeinstall.sh /usr/local/bin/citrix /usr/bin/keychain

echo >/etc/security/limits.d/systemd.conf "* hard nofile 1048576"

chown -R ${devusername}:${devusername} ${home}/${devusername}

ln -sf $(find /opt -type d -name 'idea*' -maxdepth 1) /opt/idea 
