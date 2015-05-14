#!/usr/bin/env bash

# Check:
# http://docs.vagrantup.com/v2/getting-started/provisioning.html

## #############################################################################
## Java (Oracle-JDK)
## References: 
## + http://askubuntu.com/questions/190582/installing-java-automatically-with-silent-option
## + http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
## + http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
## #############################################################################

echo "## ######################################################################"
echo "## Java (Oracle)"
echo "## ######################################################################"

# Accepting licence without stopping provisioning
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Installing from Webupd 8 Team
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update

# Java 7
sudo apt-get -y install oracle-java7-installer

# Java 8
# sudo apt-get install oracle-java8-installer

