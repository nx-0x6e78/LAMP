sudo killall -u tomcat
sudo userdel --remove -f tomcat
sudo rm -rf /opt/tomcat

sudo systemctl stop tomcat
sudo rm -f /etc/systemd/system/tomcat.service

sudo systemctl reset-failed
sudo systemctl daemon-reload