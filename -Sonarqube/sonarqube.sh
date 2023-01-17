#/usr/bin/bash
useradd sonar
yum install wget unzip java-11-openjdk-devel -y 
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.8.0.63668.zip
unzip sonarqube-9.8.0.63668.zip -d /opt/
mv /opt/sonarqube-9.8.0.63668 /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
service sonar start
