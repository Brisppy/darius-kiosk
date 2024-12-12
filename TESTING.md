* Live mode without anything plugged in - Opens TTY, displays 'no connection' MOTD at login.
  * Plug in Wifi, run configure - Connects to network, opens browser.
    * Force close kiosk by repeatedly restarting - Opens TTY, restarts by running restart-kiosk afterwards.
    * Restarting successfully connects to wireless network again and opens Kiosk.
* Live mode with wireless USB card - Opens TTY, displays 'no connection' MOTD at login. 'configure' command sets up wireless configuration and launched Edge.
* Live mode with Ethernet - Launches right into Edge.