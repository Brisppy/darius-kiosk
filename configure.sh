#!/bin/bash
# This script performs initial setup and configuration for the Darius Kiosk.

echo "Do you want to change the landing page URL? y/N"
read -r MODIFY_LANDING_PAGE

# perform landing page setup
if [[ "$MODIFY_LANDING_PAGE" == "y" || "$MODIFY_LANDING_PAGE" == "Y" ]]; then
  echo "Enter the URL of the website you wish to display on startup."
  read -r LANDING_PAGE_URL
  # create modified systemd service
  SCRIPT_DIR=$(dirname "$0")
  sed "s%INSERT_URL_HERE%$LANDING_PAGE_URL%g" "$SCRIPT_DIR/darius-kiosk.service" > "/etc/systemd/system/darius-kiosk.service"
  systemctl daemon-reload
  systemctl enable darius-kiosk.service
fi

echo "Do you want to change the WiFi configuration? y/N"
read -r MODIFY_WIFI

# perform wifi setup
if [[ "$MODIFY_WIFI" == "y" || "$MODIFY_WIFI" == "Y" ]]; then
  # list available networks
  nmcli dev wifi list

  echo "Enter the SSID of the network you wish to join."
  read -r WIFI_SSID
  echo "Enter the password for this network."
  read -r WIFI_PASS
  nmcli dev wifi connect "$WIFI_SSID" password "$WIFI_PASS"
fi

# restart service
systemctl restart darius-kiosk.service
