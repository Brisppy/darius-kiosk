alias configure="sudo /opt/darius-kiosk/configure.sh"
alias restart-kiosk="sudo systemctl restart darius-kiosk"

echo "###################################################"

ping -q -c1 1.1.1.1 &>/dev/null || echo "
    No internet connection could be established
    or device configuration incomplete."

echo "
    Run the 'configure' command to modify the
    landing page and WiFi settings."

echo "
    Use the 'restart-kiosk' command if the kiosk
    service isn't running."

echo "
###################################################"
