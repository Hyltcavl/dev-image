#!/bin/bash
#Create config file
touch ~/.bashrc
#touch ~/.zshrc

# Install basic development tools
echo "Install basic development tools"
apt-get update 
apt-get install -y \
    apt-utils \
    git \
    curl \
    build-essential \
    python3 \
    python3-pip \
    nano \
    wget \
    && apt-get clean

#Terraform
echo "Install Terraform"
apt-get update && apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt-get install -y terraform
terraform -install-autocomplete
terraform -version

# Setup git
echo "Setup git"
git config --global user.name "teodor"
git config --global user.email "teodor.englund@gmail.com"

# install nvm / node
echo "Install NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source ~/.bashrc
echo 'Installing NodeJS LTS'
nvm --version
nvm install --lts
nvm current

# install java
echo "Install JAVA"
apt-get -qq -y install default-jre
apt-get -qq -y install default-jdk
wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
tar -xvf apache-maven-3.6.3-bin.tar.gz
mv apache-maven-3.6.3 /opt/
M2_HOME='/opt/apache-maven-3.6.3'
PATH="$M2_HOME/bin:$PATH"
export PATH
mvn -version

# install c# or use https://learn.microsoft.com/en-us/dotnet/core/install/linux-scripted-manual
echo "Install C#"
apt install -y zlib1g
apt-get update && apt-get install -y dotnet-sdk-8.0
apt-get update && apt-get install -y aspnetcore-runtime-8.0

#az cli
echo "Install AZ-CLI"
curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# get bash aliases
cp .bash_aliases ~/

# source bashrc
source ~/.bashrc