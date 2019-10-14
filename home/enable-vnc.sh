vncpasswd -service
echo "Authentication=VncAuth" > /etc/vnc/config.d/common.custom
systemctl restart vncserver-x11-serviced
