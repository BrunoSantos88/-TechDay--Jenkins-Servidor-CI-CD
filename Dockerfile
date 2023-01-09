FROM jenkins/jenkins:lts
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get -y install docker-ce
RUN apt install maven -y
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y

#aws cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
RUN apt-get install zip unzip -y
RUN	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN	unzip awscliv2.zip && ./aws/install

# install Kubectl e EKS Cli
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
RUN cp kubectl /usr/local/bin/
RUN apt-get install tar -y
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin
RUN export PATH=$PATH:/usr/local/bin
RUN echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc

# terraform 
RUN apt-get update
# Install docker + other packages to get terraform setup
RUN apt install docker.io gnupg curl software-properties-common -y
# Setup terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt update
RUN apt install terraform

    
RUN usermod -aG docker jenkins
