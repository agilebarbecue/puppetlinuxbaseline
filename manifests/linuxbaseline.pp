class puppetlinuxbaseline::linuxbaseline (String $username = "paul") {
    
# linux baseline
if($operatingsystem == "ubuntu" or "${facts["os"]["distro"]["codename"]}" == "kali-rolling" ) {
file { "/tmp/pup-fixubuntu.sh" :
    ensure => file,
    source => "puppet:///modules/puppetlinuxbaseline/resources/fixubuntu.sh"
}->
exec { "run fix ubuntu script" :
  timeout => 1800,
  command => "/bin/bash /tmp/pup-fixubuntu.sh",
  returns => [0,1]
}->
exec { "update apt database" :
  timeout => 1800,
  command => "/usr/bin/apt-get update"
}->
exec { "base-os-update" :
  timeout => 1800,
  command => "/usr/bin/apt-get -y --force-yes dist-upgrade"
}->
notify { "pre-packages" : }
}

if($operatingsystem == "Amazon") {
  exec { "base-os-update" : 
  timeout => 1800,
  command => "/usr/bin/yum -y update"
  }->
  notify { "pre-packages" : }
}

if($operatingsystem == "fedora") {
  exec { "base-os-update" : 
  timeout => 1800,
  command => "/usr/bin/dnf -y update"
  }->
  exec { "python deps" :
  timeout => 1800,
  command => "/usr/bin/dnf -y builddep python3 kernel firefox gimp audacity konsole vim",
  }->
  file { "/etc/selinux/config" :
	ensure => file,
	source => "puppet:///modules/puppetlinuxbaseline/resources/selinux-config"
  }->
  notify { "pre-packages" : }
}


file { [ "/usr/share/fonts", "/usr/share/fonts/truetype", "/usr/share/fonts/truetype/freefont" ] :
  ensure => directory,
  require => Exec["base-os-update"]
}->
file { "/usr/share/fonts/truetype/freefont/noxisttf16.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/noxisttf16.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/pragmatapro.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/pragmatapro.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/pragmataprobold.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/pragmataprobold.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/Interface-Regular.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/Interface-Regular.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/Interface-Medium.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/Interface-Medium.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/expressway_rg-webfont.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/expressway_rg-webfont.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/iosevka-term-ss08-medium.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/iosevka-term-ss08-regular.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/iosevka-term-ss08-regular.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/iosevka-term-ss08-regular.ttf"
}->
file { "/usr/share/fonts/truetype/freefont/Iosevka Term Nerd Font Complete Mono.ttf" :
  ensure => file,
  mode => "0644",
  source => "puppet:///modules/puppetlinuxbaseline/resources/Iosevka Term Nerd Font Complete Mono.ttf"
}->
file { "/home/${username}/.ssh" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.ssh/config" :
  ensure => file,
  owner => "${username}",
  mode => "0600",
  source => "puppet:///modules/puppetlinuxbaseline/resources/config"
}->
file { "/home/${username}/.ssh/authorized_keys" :
  mode => "0600",
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/id_rsa_pjcsmartcard.pub"
}->
file { "/home/${username}/.bashrc" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/bashrc"
}->
file { "/home/${username}/.Xresources" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/Xresources"
}->
file { "/root/.bashrc" :
  ensure => file,
  owner => "root",
  source => "puppet:///modules/puppetlinuxbaseline/resources/bashrc"
}->
file { "/home/${username}/.zshrc" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/zshrc"
}->
file { "/home/${username}/.tmux.conf" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/tmux.conf"
}->
file { "/home/${username}/.tmux-yank.sh" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/tmux-yank.sh"
}->
file { "/home/${username}/.config" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.config/Yubico" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.config/Yubico/u2f_keys" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/u2f_keys"
}->
file { "/home/${username}/.config/alacritty" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.config/alacritty/alacritty.yml" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/alacritty.yml"
}->
file { "/home/${username}/.wireguard" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.wireguard/up.sh" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/up.sh"
}->
file { "/home/${username}/.config/i3" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.config/gtk-3.0" :
  ensure => directory,
  owner => "${username}"
}->
file { "/home/${username}/.config/i3/config" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3-config"
}->
file { "/home/${username}/.i3status.conf" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3status.conf"
}->
file { "/home/${username}/.config/gtk-3.0/gtk.css" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/gtk.css"
}->
file { "/usr/bin/i3-gnome" :
  ensure => file,
  owner => "${username}",
  mode => "0755",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3-gnome"
}->
file { "/usr/share/applications" :
  ensure => directory,
  owner => root
}->
file { "/usr/share/gnome-session" :
  ensure => directory,
  owner => root
}->
file { "/usr/share/gnome-session/sessions" :
  ensure => directory,
  owner => root
}->
file { "/usr/share/xsessions" :
  ensure => directory,
  owner => root
}->
file { "/usr/share/applications/i3-gnome.desktop" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3-gnome.desktop"
}->
file { "/usr/share/gnome-session/sessions/i3-gnome.session" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3-gnome.session"
}->
file { "/usr/share/xsessions/i3-gnome.desktop" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/i3-gnome-xsession.desktop"
}->
file { "/etc/openvpn" : 
  ensure => directory,
  owner => "${username}",
}->
file { "/etc/openvpn/client.conf" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/client.conf"
}->
file { "/etc/openvpn/ca.crt" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/ca.crt"
}->
file { "/home/${username}/.vim" :
  ensure => directory,
  owner => "${username}",
}->
file { "/home/${username}/.vim/autoload" :
  ensure => directory,
  owner => "${username}",
}->
file { "/home/${username}/.vim/after" :
  ensure => directory,
  owner => "${username}",
}->
file { "/home/${username}/.vim/after/ftplugin" :
  ensure => directory,
  owner => "${username}",
}->
file { "/home/${username}/.vim/autoload/pathogen.vim" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/pathogen.vim"
}->
file { "/home/${username}/.vimrc" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/vimrc"
}->
file { "/home/${username}/.vim/after/ftplugin/python.vim" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/ftplugin-python.vim"
}->
file { "/home/${username}/.compton.conf" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/compton.conf"
}->
file { "/home/${username}/.dircolors" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/.dircolors"
}->
file { "/etc/git-completion.bash" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/git-completion.bash"
}->
file { "/home/${username}/.gitconfig" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/gitconfig"
}->
file { "/home/${username}/.xprofile" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/xprofile"
}->
file { "/etc/git-prompt.sh" :
  ensure => file,
  owner => "${username}",
  source => "puppet:///modules/puppetlinuxbaseline/resources/git-prompt.sh"
}->
file { "/usr/local/bin/lein" :
  ensure => file,
  mode => "0555",
  source => "puppet:///modules/puppetlinuxbaseline/resources/lein"
}->
file { "/usr/local/bin/startsway" :
  ensure => file,
  mode => "0555",
  source => "puppet:///modules/puppetlinuxbaseline/resources/startsway"
}->
file { "/usr/local/bin/gg" :
  ensure => file,
  mode => "0555",
  source => "puppet:///modules/puppetlinuxbaseline/resources/gg"
}->
file { "/usr/bin/keychain" :
  ensure => file,
  mode => "0555",
  source => "puppet:///modules/puppetlinuxbaseline/resources/keychain"
}->
file { "/tmp/viminstall.sh" :
  ensure => file,
  mode => "0777",
  source => "puppet:///modules/puppetlinuxbaseline/resources/viminstall.sh"
}->
file { "/tmp/chromeinstall.sh" :
  ensure => file,
  mode => "0777",
  source => "puppet:///modules/puppetlinuxbaseline/resources/chromeinstall.sh"
}->
file { "/etc/ssh" :
  ensure => directory,
  owner => "root",
}->
file { "/etc/ssh/sshd_config" :
  ensure => file,
  mode => "0600",
  source => "puppet:///modules/puppetlinuxbaseline/resources/sshd_config"
}->
file { "/home/${username}/.config/kitty" :
  ensure => directory,
  owner => "${username}",
}->
file { "/home/${username}/.config/kitty/kitty.conf" :
  ensure => file,
  mode => "0600",
  source => "puppet:///modules/puppetlinuxbaseline/resources/kitty.conf"
}->
file { "/usr/local/bin/citrix" :
  ensure => file,
  owner => "root",
  mode => "0755",
  source => "puppet:///modules/puppetlinuxbaseline/resources/citrix"
}->
notify { "all-files" : }

if($operatingsystem=="ubuntu" or "${facts["os"]["distro"]["codename"]}"=="kali-rolling") {
notify { "os-specific-packages" : } ->
package { [ 
"terminator"
,"build-essential"
,"winbind"
,"libnss-winbind"
,"g++"
,"fvwm-crystal"
,"gimp-data"
,"gimp-plugin-registry"
,"perl-doc"
,"remmina"
,"mesa-utils"
,"frei0r-plugins"
,"libavcodec-extra"
,"libgsm1-dev"
,"libspeex-dev"
,"libtheora-dev"
,"ubuntu-restricted-extras"
,"vlc"
,"mplayer"
,"libvorbis-dev"
,"p7zip-rar"
,"p7zip-full"
,"unrar"
,"ruby-compass"
,"vim"
,"keychain"
,"bup"
,"ssh"
,"x264"
,"x265"
,"ffmpeg"
,"libbz2-dev"
,"libgdbm-dev"
,"libsqlite3-dev"
,"libreadline-dev"
,"libncurses-dev"
,"libssl-dev"
,"zlib1g-dev"
,"liblzma-dev"
,"python3-tk"
,"python3-venv"
,"python3-dev"
,"tk-dev"
,"silversearcher-ag"
,"gitk"
,"gimp"
,"audacity"
,"virt-viewer"
,"i3"
,"curl"
,"xcape"
,"jq"
] :
  ensure => "latest"
}->
notify { "dist-packages" : }
}

#common plugins
notify { "generic-packages" : require => Notify["pre-packages"]} ->
package { [
          "cifs-utils"
          ,"htop"
          ,"git"
          ,"subversion"
          ,"samba"
          ,"perl"
          ,"ruby"
          ,"python3"
          ,"dos2unix"
          ,"openvpn"
          ,"sharutils"
          ,"iotop"
          ,"tig"
          ,"tmux"
          ,"dkms"
          ,"cmake"
          ] :
  ensure => "latest"
}

if($operatingsystem == "centos" or $operatingsystem == "Amazon") {
  notify { "os-specific-packages" :
  require => Notify["generic-packages"]
  } ->
  package { [
    "kernel-devel"
    ,"gcc-c++"
    ,"xorg-x11-server-Xvfb"
    ,"p7zip-plugins"
    ,"vim-enhanced"
    ,"openssh-clients"
    ] : 
    ensure => "latest"
}->
notify { "dist-packages" : }
}

if($operatingsystem == "fedora") {
  notify { "os-specific-packages" :
    require => Notify["generic-packages"]
  } ->
  package { [
    "@xfce",
    "kernel-devel",
    "terminator",
    "libX11-devel",
    "libXcomposite-devel",
    "libXdamage-devel",
    "libXfixes-devel",
    "libXext-devel",
    "libXrender-devel",
    "libXinerama-devel",
    "xorg-x11-proto-devel",
    "xorg-x11-utils",
    "pcre2-devel",
    "libconfig-devel",
    "libdrm-devel",
    "mesa-libGL-devel",
    "dbus-devel",
    "asciidoc",
    "strace",
    "remmina",
    "vim",
    "python3-autopep8",
    "qrencode"
  ]: ensure => "latest"
}->
notify { "dist-packages" : }
}

if($operatingsystem == "ubuntu") {
exec { "autoremove" :
  timeout => 1800,
  command => "/usr/bin/apt-get -y autoremove"
}}

exec { "viminstaller" : 
    timeout => 1800,
    command => "/bin/bash /tmp/viminstall.sh",
    require => Notify["dist-packages"],
    unless => "/usr/bin/test -d /home/${username}/.vim/bundle"
}

if($operatingsystem == "ubuntu") {
  exec { "googlechrome" :
      timeout => 1800,
      command => "/bin/bash /tmp/chromeinstall.sh",
      require => Notify["dist-packages"],
      unless => "/usr/bin/test -f /usr/bin/google-chrome"
  }
}


}
