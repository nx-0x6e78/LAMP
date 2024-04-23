sudo apt-get update -y 
sudo apt install openjdk-11-jdk

sudo useradd -m -U -d /opt/tomcat -s /bin/false tomcat
[ -f /tmp/apache-tomcat-10.1.19.tar.gz ] || sudo wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.19/bin/apache-tomcat-10.1.19.tar.gz -P /tmp

[ -d /opt/tomcat ] || sudo mkdir /opt/tomcat

sudo tar -xf /tmp/apache-tomcat-10.1.19.tar.gz -C /opt/tomcat/

sudo ln -s /opt/tomcat/apache-tomcat-10.1.19 /opt/tomcat/latest

sudo chown -R tomcat: /opt/tomcat
sudo sh -c 'sudo chmod +x /opt/tomcat/latest/bin/*.sh'

sudo cp ./other/tomcat.service /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload
# sudo systemctl enable --now tomcat
# sudo systemctl status tomcat

# SOURCE linuxize.com
