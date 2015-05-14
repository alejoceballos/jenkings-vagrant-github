# **Jenkings (Ubuntu Vagrant) + Github Hook**
Formerly know as **JENKINS@localhost with HOOK@github**

This project goal is to be used as a tutorial that offers all the necessary infrastructure to start using Jenkins. 

After completing all the steps displayed here you will:

+ Have an Ubuntu distro (Trusty/Tahr) running in a Vagrant VM;
+ Have Jenkins running (with all necessary plugins);
+ Have Github's Service Hook rsponsible for triggering Jenkins build.

#### Some useful links:

+ https://jenkins-ci.org/
+ https://github.com/

## Assumptions

#### 1) You are using a Debian-Like distro

All this tutorial was tested using **Ubuntu** (Trusty/Tahr) as the host machine for the VM. It means that if you are using another Operating System you must deduce yourself how to "translate" all these steps. 

I believe that for **Unix-like** OSs won't be such a fuzz (i.e. Mac). Windows on the other hand... I have not a clue!

#### 2) You are connected to the internet

I shouldn't have to say that there will be a lot of downloads going on (specially from apt-get). Anyway, you are trying to hook Jenkins and Github! Of course you have an internet connection!

# **Install** VirtualBox / Vagrant

I have used the VirtualBox + Vagrant combination to create a guest machine running my Jenkins server on port 8081.

#### Useful links:

+ https://www.virtualbox.org/
+ https://www.vagrantup.com/

## Steps:

#### 1) Install Virtualbox:

    sudo apt-get install virtualbox

#### 2) Install Vagrant:

    sudo apt-get install vagrant

#### 3) Install GuestAdditions:

    vagrant plugin install vagrant-vbguest

#### 4) Add "Ubuntu Trusty/Tahr" box:

This will take a while depending on your internet connection.

    vagrant box add ubuntu/trusty64 https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20150427.0.0/providers/virtualbox.box

#### References: 

1. http://www.olindata.com/blog/2014/07/installing-vagrant-and-virtual-box-ubuntu-1404-lts
2. https://github.com/dotless-de/vagrant-vbguest


# **Download** project files

If you have git, wonderful! Just clone this project!

    git clone git@github.com:alejoceballos/jenkings-vagrant-github.git
    
If not, download the ZIP file and unzip it.

# **Creating** the VM

Assuming you performed the previous steps perfectly, just go to "vagrant-jenkins" directory an type:

    vagrant up
    
This will take a while. Be sure you have a good internet connection. If you wanna know what is being installed, check the provisioning shell script files that are executed during VM startup.

## What does provisioning scripts do?

1. Starts an Ubuntu 14.04 VM with 1 CPU and 512 RAM memory;
2. Forwards port 8080 in guest machine to 8081 in host machine; 
3. Installs Git (apt-get);
4. Installs Java 7 (new PPA and apt-get);
5. Installs Maven (apt-get);
6. Install Jenkins (new sources and apt-get);
7. Install Jenkins plugins (wget).

## Access your Jenkins server

After provisioning is done, Jenkins server should be up and running. Open your favorite browser and type the URL:

    http://locahost:8081

# **Allowing** Jenkins external visibility

When events are triggered in Github, it must contact our Jenkins server with a message indicating which event has been triggered. 

#### 1) Installing NGROK

    sudo apt-get install ngrok-client
    
#### 2) Running NGROK

    ngrok 8081    

# **Setting** Github's Event Webhook

TBD 

#### Useful links:

https://developer.github.com/webhooks/

#### References:

# **Creating** a new Jenkins Maven Project

TBD 

#### References:

+ https://github.com/juretta/hudson-github-plugin/issues/4
+ https://github.com/{user}/{project}/settings/hooks
+ https://developer.github.com/webhooks/
+ https://github.com/juretta/hudson-github-plugin/issues/4
+ http://nepalonrails.tumblr.com/post/14217655627/set-up-jenkins-ci-on-ubuntu-for-+ painless-rails3
+ http://www.svenbit.com/2014/09/run-ngrok-on-your-own-server/
+ http://stackoverflow.com/questions/10018496/run-tests-in-jenkins-automatically-+ after-each-commit-change
+ https://developer.github.com/webhooks/testing/
+ https://developer.github.com/webhooks/creating/
+ https://developer.github.com/webhooks/configuring/