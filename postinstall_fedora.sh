#!/bin/bash
#
#Encoding Unicode (UTF-8)
#
#GNU General Public Licence v3.0
#Copyright (c) 2017 Vivek Bhagat
#
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.


##Adding user to wheel group (sudo)
su -c 'usermod -aG wheel username'
su - username


##Changing default hostname
hostnamectl set-hostname blackhole


##Changing ip address to static and configuring network adapter
sudo sed -i '/BOOTPROTO=dhcp/ c\BOOTPROTO=none' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '/PEERDNS=yes/ c\#PEERDNS=yes' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '/PEERROUTES=yes c\#PEERROUTES=yes' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a MACADDR=Your mac address' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a IPADDR=Your IP address' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a PREFIX=24' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a GATEWAY=Your gateway' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a DNS1=8.8.8.8' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a DNS1=8.8.4.4' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a DNS3=2001:4860:4860::8888' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a DNS4=2001:4860:4860::8844' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a IPV6_PEERDNS=no' /etc/sysconfig/network-scripts/ifcfg-enp0s25
sudo sed -i '$ a IPV6_PEERROUTES=yes' /etc/sysconfig/network-scripts/ifcfg-enp0s25
systemctl restart network.service


##Creating rpmfusion (free and non-free) repo
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


##Creating EPEL repo
cd ~/Downloads
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo dnf install epel-release-latest-7.noarch.rpm
cd ~


##Creating paper (gtk and icon) theme repo
#for Fedora 26
sudo dnf -y copr enable snwh/paper
#
#for Fedora 25
#sudo dnf config-manager --add-repo http://download.opensuse.org/repositories/home:snwh:paper/Fedora_25/home:snwh:paper.repo


##Creating genome shell extension repo
sudo dnf -y copr enable region51/chrome-gnome-shell


##Creating gnome pomodoro repo
cd /etc/yum.repos.d/
sudo wget http://download.opensuse.org/repositories/home:kamilprusko/Fedora_25/home:kamilprusko.repo
cd ~


##Creating cupscloudprint (Google cloud print) repo
sudo sed -i '$ a [niftyrepo]' /etc/yum.repos.d/niftyrepo.repo
sudo sed -i '$ a name=niftyrepo' /etc/yum.repos.d/niftyrepo.repo
sudo sed -i '$ a baseurl=https://niftyrepo.niftiestsoftware.com/rpm/' /etc/yum.repos.d/niftyrepo.repo
sudo sed -i '$ a gpgcheck=1' /etc/yum.repos.d/niftyrepo.repo
sudo sed -i '$ a gpgkey=https://niftyrepo.niftiestsoftware.com/rpm/RPM-GPG-KEY-niftiestsoftware' /etc/yum.repos.d/niftyrepo.repo


##Creating docker repo
sudo dnf -y config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
#sudo dnf makecache fast


##Creating cert forensic repo
cd ~/Downloads
sudo wget https://forensics.cert.org/cert-forensics-tools-release-26.rpm
sudo dnf -y install cert-forensics-tools-release-26.rpm
cd ~


##Creating Adobe flash player repo
sudo dnf -y install ~/Downloads/adobe-release-x86_64-1.0-1.noarch.rpm


##Creating Etcher repo
sudo wget https://bintray.com/resin-io/redhat/rpm -O /etc/yum.repos.d/bintray-resin-io-redhat.repo


##Changing the no of installed kernel parameter
sudo sed -i '/installonly_limit=3/ c\installonly_limit=2' /etc/dnf/dnf.conf
#Removing old kernels
#rpm -q kernel
#sudo dnf -y install yum-utils
#package-cleanup --oldkernels --count=2


##Updating system to the latest version
sudo dnf -y update


##Installing applications
sudo dnf -y install vim
sudo dnf -y install terminator
sudo dnf -y install gnome-tweak-tool
sudo dnf -y install thunderbird
sudo dnf -y install chrome-gnome-shell
sudo dnf -y install dconf-editor
sudo dnf -y install flash-plugin
sudo dnf -y install vlc
sudo dnf -y install tor
sudo dnf -y install torbrowser-launcher
torbrowser-launcher
sudo dnf -y install tomahawk
sudo dnf -y install youtube-dl
sudo dnf -y install kde-connect
sudo pip3 install mps-youtube dbus-python pygobject
sudo dnf -y install bleachbit
sudo dnf -y install paper-gtk-theme
sudo dnf -y install paper-icon-theme
sudo dnf -y install ffmpeg
sudo dnf -y install google-authenticator
sudo dnf -y install libcurl
sudo dnf -y install wget
sudo dnf -y install etcher-electron
sudo dnf -y install gnome-pomodoro
sudo dnf -y install tlp tlp-rdw
sudo dnf -y install smartmontools
sudo dnf -y install docker
sudo dnf -y install python-cups
sudo dnf -y install cupscloudprint
sudo dnf -y install android-tools
sudo dnf -y install heimdall
sudo dnf -y install heimdall-frontend
#sudo dnf -y install ~/downloads/adobe-release-x86_64-1.0-1.noarch.rpm
sudo dnf -y install ~/Downloads/atom.x86_64.rpm
sudo dnf -y install ~/Downloads/google-chrome-stable_current_x86_64.rpm
sudo dnf -y install zlib.i686 ncurses-libs.i686 bzip2-libs.i686 compat-libstdc++-296 compat-libstdc++-33 glibc libgcc nss-softokn-freebl libstdc++ ant
/usr/local/android-studio/bin/./studio.sh
#lspci -nnk |grep -A 3 -i vga
sudo dnf -y install xorg-x11-drv-amdgpu.x86_64
#sudo dnf -y install winehq


##Manually starting tlp
sudo tlp start
sudo systemctl start tlp.service
sudo systemctl start tlp-sleep.service
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo systemctl enable NetworkManager-dispatcher.service
#maskin the following service to avoid conflicts and assure proper operation of TLP's radio device switching option
sudo systemctl mask systemd-rfkill.service

##Manually start docker
sudo systemctl start docker
sudo systemctl enable docker


##Configuring netwok bonding


#Loding kernel bonding module
#sudo modprobe --first-time bonding

##Configuring google two factor authentication and pam.d/gdm-password
google-authenticator
sudo sed -i '$ a auth required pam_google_authenticator.so' /etc/pam.d/gdm-password


##Configuring ssh for two factor authentication
systemctl start sshd
systemctl enable sshd
sudo sed -i '$ a auth required pam_google_authenticator.so' /etc/pam.d/sshd
sudo sed -i '/ChallengeResponseAuthentication no/ c\#ChallengeResponseAuthentication no' /etc/ssh/sshd_config
sudo sed -i '/#ChallengeResponseAuthentication yes/ c\ChallengeResponseAuthentication yes' /etc/ssh/sshd_config
sudo sed -i '/PermitRootLogin yes/ c\PermitRootLogin no' /etc/ssh/sshd_config


##Configuring cupscloudprint
sudo /usr/share/cloudprint-cups/setupcloudprint.py


##Git configuring (generate personal access token)
git config --global user.email "Your email address"
git config --global user.name "your github username"

#Set git to use the credential memory cache
#git config --global credential.helper cache

# Set the cache to timeout after 1 hour (setting is in seconds)
#git config --global credential.helper 'cache --timeout=3600'

#Set git to use the credential memory store
#Default location of stored credential is ~/.git-credentials
git config --global credential.helper store

#To store credential with a custom file name and location
#git config --global credential.helper 'store --file ~/.my-credentials'

#.gitconfig (~/.gitconfig) would look like if you had a credentials file on a thumb drive, but wanted to use the in-memory cache to save some typing if the drive isn’t plugged in:
#[credential]
#    helper = store --file /mnt/thumbdrive/.git-credentials
#    helper = cache --timeout 36000


##Configuring Programming environment for Atom
sudo pip install openpyxl lxml pillow python-docx
#Installing kernel for Atom Hydrogan package
sudo python3 -m pip install ipykernel
sudo python3 -m ipykernel install --user
sudo pip3 install jupyter
