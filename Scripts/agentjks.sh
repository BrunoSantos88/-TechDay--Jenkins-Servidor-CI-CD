#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install git -y
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
sudo yum install unzip -y
sudo unzip awscliv2.zip  
sudo ./aws/install

#ZAP is isntalled at /home/ec2-user/ZAP_2.11.1/zap.sh
sudo wget https://github.com/zaproxy/zaproxy/releases/download/v2.11.1/ZAP_2_11_1_unix.sh
sudo chmod +x ZAP_2_11_1_unix.sh 
sudo ./ZAP_2_11_1_unix.sh -q
sudo tar -xvf ZAP_2.11.1_Linux.tar.gz

#kubectl
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
sudo cp kubectl /usr/local/bin/

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

sudo yum install docker -y
sudo usermod -aG docker $USER
sudo newgrp docker
sudo newgrp docker
sudo systemctl daemon-reload
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
sudo yum install jq -y

# terraform 1.37
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

#nodeJS e NPM
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
sudo . ~/.nvm/nvm.sh
sudo nvm install node

#SonarScanner

sudo yum install wget unzip -y
Sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472-linux.zip
Sudo unzip sonar-scanner-cli-4.6.2.2472-linux.zip -d /opt/
Sudo mv /opt/sonar-scanner-4.6.2.2472-linux /opt/sonar-scanner
sudo chown -R jenkins:jenkins /opt/sonar-scanner
Sudo echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
Sudo curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y