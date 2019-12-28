# Update catalog
pacman -Sy --noconfirm

# Update keyring - reduce chance of lookup from keyserver failing?
pacman -S --noconfirm --needed archlinux-keyring

# If pre-prepared mirrorlist already exists in .\vagrant then use that,
# otherwise generate one
FILE=/vagrant/mirrorlist
if [ -f "$FILE" ]; then
    echo "$FILE exists"
    cp $FILE /etc/pacman.d/mirrorlist
else 
    echo "$FILE does not exist"
    . /vagrant/shell/set_proxy.sh
    pacman -S --noconfirm --needed reflector

    export http_proxy=
    reflector --verbose --protocol http --sort rate --save /etc/pacman.d/mirrorlist
    cp /etc/pacman.d/mirrorlist $FILE
fi

# Update existing packages
. /vagrant/shell/set_proxy.sh

pacman -Su --noconfirm

#pacman -S --noconfirm --needed base-devel
#pacman -S --noconfirm --needed git
#pacman -S --noconfirm --needed dosfstools
#pacman -S --noconfirm --needed openssh
#pacman -S --noconfirm --needed os-prober
#pacman -S --noconfirm --needed mtools
#pacman -S --noconfirm --needed linux-headers
#pacman -S --noconfirm --needed linux-lts
#pacman -S --noconfirm --needed linux-lts-headers
#pacman -S --noconfirm --needed network-manager-applet
#pacman -S --noconfirm --needed networkmanager
#pacman -S --noconfirm --needed wireless_tools
#pacman -S --noconfirm --needed wpa_supplicant
#pacman -S --noconfirm --needed dialog