#This the post install script to install and configure softwares

#Adding pen repo to source list
#sudo sed -i '$ a deb file:///media/saraswatiacademy/testn/pen main repo' /etc/apt/sources.list
#sudo sed -i '$ a deb file:///media/saraswatiacademy/testn/pen/main repo/' /etc/apt/sources.list

#Enabling canonical partner repo
#for Bionic Beaver
sudo sed -i '/# deb http:\/\/archive.canonical.com\/ubuntu bionic partner/ c\deb http:\/\/archive.canonical.com\/ubuntu bionic partner' /etc/apt/sources.list
#for Xenial Xerus
#sudo sed -i '/# deb http:\/\/archive.canonical.com\/ubuntu xenial partner/ c\deb http:\/\/archive.canonical.com\/ubuntu xenial partner' /etc/apt/sources.list

#echo "SHOW VARIABLES LIKE 'validate_password%';"
#echo "SET GLOBAL validate_password.length = 4;"
#echo "SET GLOBAL validate_password.number_count = 0;"
#echo "SET GLOBAL validate_password.policy = LOW;"
#echo "SET GLOBAL validate_password.special_char_count = 0;"
#echo "SET GLOBAL validate_password.mixed_case_count = 0;"
#Adding Libreoffice repo
#sudo add-apt-repository -y ppa:libreoffice/ppa

#sudo cp -a /media/saraswatiacademy/testn/lib/apt /var/lib/
#sudo cp -a /media/saraswatiacademy/testn/cache/apt/archives /var/cache/apt/
#sudo cp -a /media/saraswatiacademy/testn/dpkg /var/lib/
#sudo cp -a /media/saraswatiacademy/testn/TC/ /home/saraswatiacademy
#sudo cp -a /media/saraswatiacademy/testn/input.txt ~/bin

#Adding f.lux repo
#sudo add-apt-repository -y ppa:nathan-renniewaldock/flux

#Update Repositories
#sudo apt-get purge
#sudo apt-get clean
#sudo apt-get clean all
sudo apt-get -y update
sudo apt-get -y update --allow-releaseinfo-change
sudo apt-get -y upgrade

#Software
sudo apt-get -y install firefox
sudo apt-get -y install vim
sudo apt-get -y install scratch
sudo apt-get -y install libreoffice
sudo apt-get -y install basic256
sudo apt-get -y install tupi
sudo apt-get -y install openshot
sudo apt-get -y install gimp
sudo apt-get -y install vlc
sudo apt-get -y install gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad
sudo apt-get -y install libavcodec-extra
sudo apt-get -y install tuxpaint
sudo apt-get -y install tuxmath
sudo apt-get -y install tuxtype
sudo apt-get -y install pencil2d
sudo apt-get -y install spyder3
sudo apt-get -y install tlp
sudo apt-get -y install dconf-editor
sudo apt-get -y install overlayroot
#sudo apt-get -y install dosbox
#sudo apt-get -y install virtualbox
#sudo apt-get -y install qemu qemu-kvm libvirt-bin  bridge-utils  virt-manager
#sudo apt-get -y install redshift
#sudo apt-get -y install redshift-gtk
#sudo apt-get -y install bleachbit
#sudo apt-get -y install ubuntu-restricted-extras
#sudo apt-get -y install netbeans
#sudo apt-get -y install wine
#sudo apt-get -y install playonlinux
#sudo apt-get -y install samba
#sudo apt-get -y install winbind
#sudo apt-get -y install winetricks
#./jdk-8u171-nb-8_2-linux-x64.sh

#Configuring overlayroot and grub
#sudo sed -i 's/overlayroot=""/overlayroot="tmpfs:swap=1,recurse=0"/g' /etc/overlayroot.conf
#sudo sed -i 's/GRUB_TIMEOUT=0/GRUB_TIMEOUT=1/g' /etc/default/grub
#sudo update-grub
#overlay=disable in linux

#sudo apt-get -y install initramfs-tools
#sudo apt-get -y install aufs-tools
#sudo apt-get -y install fsprotect
#sudo sed -i '/copy_exec \/usr\/bin\/touch "\/bin" c\#copy_exec /usr/bin/touch "/bin"' /usr/share/initramfs-tools/hooks/fsprotect
#sudo apt-get -y install fsprotect
#sudo sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash\" c\GRUB_CMDLINE_LINUX_DEFAULT=\"quiet splash fsprotect=1G\"' /etc/default/grub
#sudo dpkg -i lethe_0.34_all.deb
#sudo update-grub
#sudo apt-get -y install aspell-en libreoffice-l10n-en-gb libreoffice-l10n-in libreoffice-lightproof-en myspell-en-us myspell-en-gb hyphen-en-us hyphen-en-gb mythes-en-us
#sudo apt-get -y install fluxgui

#Configuring Virtualbox
#mkdir ~/VirtualBox\ VMs/
#sudo chmod 775 ~/VirtualBox\ VMs/
#sudo cp ~/bin/winxp.vdi ~/VirtualBox\ VMs/
#sudo rm -rf ~/bin/winxp.vdi
#sudo chmod 600 ~/VirtualBox\ VMs/winxp.vdi

#Configuring Dosbox for TurboC++
#dosbox -C "config -writeconf /home/saraswatiacademy/dosbox.conf" -C "exit"

#cd /home/saraswatiacademy
#sudo sed -i '$ a mount c ~' dosbox.conf
#sudo sed -i '$ a c:' dosbox.conf
#sudo sed -i '$ a cd TC' dosbox.conf
#sudo sed -i '$ a cd BIN' dosbox.conf
#sudo sed -i '$ a TC.EXE' dosbox.conf

#Installing and configuring MySQL
sudo apt-get -y install mysql-server
echo "Set root password dbms"
#sudo debconf-set-selections <<<'mysql-server mysql-server/root_password password dbms'
#sudo debconf-set-selections <<<'mysql-server mysql-server/root_password_again password dbms'
#Steps to follow for configuring MySQL
echo "Validate login? [Y/n] n"
echo "Change the root password? [Y/n] y"
echo "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 0"
echo "Please set the password for root here."
echo "New password: dbms"
echo "Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y"
echo "Remove anonymous users? [Y/n] y"
echo "Disallow root login remotely? [Y/n] y"
echo "Remove test database and access to it? [Y/n] n"
echo "Reload privilege tables now? [Y/n] y"
#sudo cat "input.txt" | mysql_secure_installation
sudo mysql_secure_installation
#sudo mysql_install_db
#sudo mysqld --initialize
#for resolving user issue and password strength
echo "SHOW VARIABLES LIKE 'validate_password%';"
echo "SET GLOBAL validate_password_length = 4;"
#echo "SET GLOBAL validate_password_number_count = 0;"
#echo "SET GLOBAL validate_password_policy = LOW;"
#echo "SET GLOBAL validate_password_special_char_count = 0;"
#echo "SET GLOBAL validate_password_mixed_case_count = 0;"
echo "CREATE USER 'sacademy'@'localhost' IDENTIFIED BY 'dbms';"
echo "GRANT ALL PRIVILEGES ON database_name.* TO 'sacademy'@'localhost';"
echo "exit"
sudo mysql -u root -pdbms
sudo systemctl restart mysql

#Configuring Qemu
#sudo service libvirtd start
#sudo update-rc.d libvirtd enable

sudo apt-get -y autoremove


#Resetting all dconf setting
#dconf reset -f /

# Adding  desktop icons
cd ~/
sudo chmod 777 Desktop
sudo chmod 777 /home/saraswatiacademy/Desktop/*.desktop
cd /usr/share/applications
cp tuxpaint.desktop /home/saraswatiacademy/Desktop/
cp tuxtype.desktop /home/saraswatiacademy/Desktop/
cp tuxmath.desktop /home/saraswatiacademy/Desktop/
cp libreoffice-writer.desktop /home/saraswatiacademy/Desktop/
cp libreoffice-calc.desktop /home/saraswatiacademy/Desktop/
cp libreoffice-impress.desktop /home/saraswatiacademy/Desktop/
cp libreoffice-base.desktop /home/saraswatiacademy/Desktop/
cp scratch.desktop /home/saraswatiacademy/Desktop/
cp tupi.desktop /home/saraswatiacademy/Desktop/
cp spyder3.desktop /home/saraswatiacademy/Desktop/
#cp netbeans.desktop /home/saraswatiacademy/Desktop/

cp openshot-qt.desktop /home/saraswatiacademy/Desktop/
sudo sed -i '/Name/ c\Name=OpenShot' /home/saraswatiacademy/Desktop/OpenShot\ Video\ Editor.desktop

cp gimp.desktop /home/saraswatiacademy/Desktop/
sudo sed -i '/Name/ c\Name=GIMP' /home/saraswatiacademy/Desktop/GNU\ Image\ Manipulation\ Program.desktop

#Assigning the basic256 application icon
sudo sed -i '/Icon/ c\Icon=/usr/share/pixmaps/basic256.png' basic256.desktop
cp basic256.desktop /home/saraswatiacademy/Desktop/

#Changing name of pencil
cp pencil2d.desktop /home/saraswatiacademy/Desktop/
sudo sed -i '/Name/ c\Name=Pencil' /home/saraswatiacademy/Desktop/pencil2d.desktop

#Creating turboc++ desktop shortcut
#sudo cp scratch.desktop turboc++.desktop
#sudo sed -i '/Exec/ c\Exec=dosbox -C "mount c ~" -C "c:" -C "cd TC/BIN" -C "TC.EXE" -C "exit"' turboc++.desktop
#sudo sed -i '/Name/ c\Name=Turboc++' turboc++.desktop
#Assigning the turboc++ applicaion icon
#sudo sed -i '/Icon/ c\Icon=/usr/share/pixmaps/turboc++.png' turboc++.desktop
#cp turboc++.desktop /home/saraswatiacademy/Desktop/

#Creating gedit (Text Editor as in book) desktop shortcut
cp gedit.desktop /home/saraswatiacademy/Desktop/
sudo sed -i '/Name/ c\Name=Text Editor' /home/saraswatiacademy/Desktop/gedit.desktop
#Changing the gedit application name to Text Editor as mention in book
sudo sed -i '24i Name[en_IN]=Text Editor' /home/saraswatiacademy/Desktop/gedit.desktop

#Creating mysql desktop shortcut and configuring
sudo cp turboc++.desktop mysql.desktop
sudo sed -i '/Exec/ c\Exec=mysql -u sacademy -pdbms' mysql.desktop
sudo sed -i '/Terminal/ c\Terminal=true' mysql.desktop
sudo sed -i '/Name/ c\Name=MySQL' mysql.desktop
sudo sed -i '/Icon/ c\Icon=/usr/share/pixmaps/mysql.png' mysql.desktop
cp mysql.desktop /home/saraswatiacademy/Desktop/
sudo chmod 755 /home/saraswatiacademy/Desktop/*.desktop

#To disable the screentime out lock
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
#Disable the suspend button in your system
gsettings set org.gnome.settings-daemon.plugins.power button-suspend "nothing"
#Revert to the default value
#gsettings set org.gnome.settings-daemon.plugins.power button-suspend "suspend"
#Disable the sleep button in your system
gsettings set org.gnome.settings-daemon.plugins.power button-sleep "nothing"
#Revert to the default value
#gsettings set org.gnome.settings-daemon.plugins.power button-sleep "hibernate"
#Disable the hibernate button in your system
gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "nothing"
#Revert to the default value
#gsettings set org.gnome.settings-daemon.plugins.power button-hibernate "hibernate"
gsettings set org.gnome.desktop.search-providers disable-external true
gsettings set org.gnome.desktop.media-handling automount-open false
gsettings set org.gnome.desktop.media-handling autorun-never true
gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
#gsettings set org.gnome.desktop.lockdown disable-log-out true

#Unity (Gnome) click to minimize
#for Bionic Beaver
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
#for Xenial Xerus
#gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ launcher-minimize-window true

#Show Application icon to top
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true

#Change the Show application icon to dash icon
cd /usr/share/icons/ && sudo gtk-update-icon-cache

#Changing the Desktop folder permission to lock it
cd ~/
sudo chmod 555 Desktop
cd bin

#Redshift configuration file
#sudo cp -a /media/saraswatiacademy/testn/redshift.conf ~/.config/

#Bluetooth and wifi off
bluetooth off
#sudo service bluetooth stop
wifi off
gsettings set com.ubuntu.touch.network flight-mode true
#sudo service network-manager stop

#Sound mute
amixer set 'Master' 0
amixer set 'Master' mute

#Disabling mounted drive/ volume icons from desktop
gsettings set org.gnome.nautilus.desktop volumes-visible 'false'

#setting background wallpaper
#gsettings set org.gnome.desktop.background draw-background false
gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/warty-final-ubuntu.png
gsettings set org.gnome.desktop.background draw-background true

#configuring different settings for speedup
gsettings set com.ubuntu.touch.network gps false

#Setting launcher icons and size
#for Xenial Xerus
#gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautilus.desktop', 'application://firefox.desktop', 'application://libreoffice-writer.desktop', 'application://libreoffice-calc.desktop', 'application://libreoffice-impress.desktop', 'application://org.gnome.Software.desktop', 'application://unity-control-center.desktop', 'unity://expo-icon', 'unity://running-apps', 'application://gnome-terminal.desktop', 'unity://devices']"
#gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 48
#for Bionic Beaverfid
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'firefox.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 30

#Setting app folder
#gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'Sundry', 'YaST']"

#Setting the Theme
gsettings set org.gnome.desktop.interface gtk-theme 'Ambiance'
gsettings set org.gnome.desktop.interface icon-theme 'ubuntu-mono-dark'

#Removing all internet connections
sudo rm -rf /etc/NetworkManager/system-connections/*

sudo systemctl restart network-manager.service

#systemctl enabled myscript.service
#systemctl active myscript.service

#Configuring the startup processes
cd /etc/xdg/autostart
sudo sed -i '$ a OnlyShowIn=GNOME;' print-applet.desktop
sudo sed -i 's/NotShowIn/#NotShowIn/g' print-applet.desktop
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' gnome-initial-setup-copy-worker.desktop gnome-initial-setup-first-login.desktop gnome-software-service.desktop gnome-welcome-tour.desktop orca-autostart.desktop org.gnome.SettingsDaemon.DiskUtilityNotify.desktop org.gnome.SettingsDaemon.PrintNotifications.desktop org.gnome.SettingsDaemon.ScreensaverProxy.desktop org.gnome.SettingsDaemon.Sharing.desktop org.gnome.SettingsDaemon.Smartcard.desktop org.gnome.SettingsDaemon.Wacom.desktop print-applet.desktop snap-userd-autostart.desktop update-notifier.desktop
sudo systemctl disable avahi-daemon
sudo chmod -x /usr/lib/evolution/evolution-addressbook-factory
sudo chmod -x /usr/lib/evolution/evolution-addressbook-factory-subprocess
sudo chmod -x /usr/lib/evolution/evolution-calendar-factory
sudo chmod -x /usr/lib/evolution/evolution-calendar-factory-subprocess 
sudo chmod -x /usr/lib/evolution/evolution-source-registry

#run this if there is some problem in dconf or app-folder
#dconf reset -f /
#cp /media/saraswatiacademy/testn/defaultconfig.dconf ~/
#dconf load / < ~/defaultconfig.dconf

