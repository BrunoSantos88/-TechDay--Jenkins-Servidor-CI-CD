#/usr/bin/bash
useradd sonar
yum install wget unzip java-11-openjdk-devel -y 
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.8.0.63668.zip
unzip sonarqube-9.8.0.63668.zip -d /opt/
mv /opt/sonarqube-9.8.0.63668.zip /opt/sonarqube
#instalar sonar scanner
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip
unzip sonar-scanner-cli/sonar-scanner-cli-4.7.0.2747-linux.zip -d /opt/
mv /opt/sonar-scanner-cli-4.7.0.2747-linux /opt/sonar-scanner
chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y