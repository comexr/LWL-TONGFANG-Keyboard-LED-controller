cd ~
sudo -v
Package-manager() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
        case $ID in
            "ubuntu"|"debian"|"linuxmint"|"pop"|"kubuntu"|"xubuntu"|"elementary"|"zorin"|"ubuntu-mate"|"neon"|"kali"|"ubuntu-studio")
                PACKAGE="deb"
                ;;
            "fedora")
                PACKAGE="rpm"
                ;;
            *)
                echo "Unsupported distribution: $ID"
                exit 1
                ;;
        esac
    else
        echo "Unsupported package manager"
        exit 1
    fi
}
Package-manager
if [ "$PACKAGE" == "deb" ]; then
	wget -q -O LWL-X6-Keyboard.deb https://github.com/comexr/lwl-x6-keyboard/releases/download/v0.1/lwl-x6-keyboard_0.1.0-1_amd64.deb
	sudo apt install -y ./LWL-X6-Keyboard.deb
	rm LWL-X6-Keyboard.deb
elif [ "$PACKAGE" == "rpm" ]; then
        wget -q -O LWL-X6-Keyboard.rpm https://github.com/comexr/lwl-x6-keyboard/releases/download/v0.1/lwl-x6-keyboard-0.1.0-1.x86_64.rpm
       	sudo dnf install -y ./LWL-X6-Keyboard.rpm
       	rm LWL-X6-Keyboard.rpm
fi
