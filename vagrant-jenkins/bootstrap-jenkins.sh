#!/usr/bin/env bash

# Check:
# http://docs.vagrantup.com/v2/getting-started/provisioning.html

## #############################################################################
## Jenkins
## References: 
## + https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu
## #############################################################################

echo "## ######################################################################"
echo "## Jenkins"
echo "## ######################################################################"

# Add PPA (didn't know this way of adding a PPA)
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

apt-get update

# Install Jenkins
apt-get -y install jenkins

# ##############################################################################
# Download and install git plugin & dependencies
# ##############################################################################

wget -O /var/lib/jenkins/plugins/mailer.hpi "http://updates.jenkins-ci.org/latest/mailer.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/mailer.hpi

# Installed by default
# "http://updates.jenkins-ci.org/latest/scm-api.hpi"

wget -O /var/lib/jenkins/plugins/matrix-project.hpi "http://updates.jenkins-ci.org/latest/matrix-project.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/matrix-project.hpi

wget -O /var/lib/jenkins/plugins/git-client.hpi "http://updates.jenkins-ci.org/latest/git-client.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/git-client.hpi

# Installed by default
# http://updates.jenkins-ci.org/latest/ssh-credentials.hpi

# Installed by default
# http://updates.jenkins-ci.org/latest/credentials.hpi

wget -O /var/lib/jenkins/plugins/git.hpi "http://updates.jenkins-ci.org/latest/git.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/git.hpi

# ##############################################################################
# Download and install github plugin & dependencies
# ##############################################################################

wget -O /var/lib/jenkins/plugins/multiple-scms.hpi "http://updates.jenkins-ci.org/latest/multiple-scms.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/multiple-scms.hpi

wget -O /var/lib/jenkins/plugins/github-api.hpi "http://updates.jenkins-ci.org/latest/github-api.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/github-api.hpi

wget -O /var/lib/jenkins/plugins/github.hpi "http://updates.jenkins-ci.org/latest/github.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/github.hpi

# ##############################################################################
# Download and install pipeline plugin & dependencies
# ##############################################################################

wget -O /var/lib/jenkins/plugins/jquery.hpi "http://updates.jenkins-ci.org/latest/jquery.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/jquery.hpi

wget -O /var/lib/jenkins/plugins/dashboard-view.hpi "http://updates.jenkins-ci.org/latest/dashboard-view.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/dashboard-view.hpi

wget -O /var/lib/jenkins/plugins/parameterized-trigger.hpi "http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/parameterized-trigger.hpi

wget -O /var/lib/jenkins/plugins/build-pipeline-plugin.hpi "http://updates.jenkins-ci.org/latest/build-pipeline-plugin.hpi"
chown jenkins:jenkins /var/lib/jenkins/plugins/build-pipeline-plugin.hpi

# Restart jenkins
/etc/init.d/jenkins restart

# ##############################################################################
# Jenkins Project
#
# Maven project name: Jack-Ketch-4-Flow
# _____________________________________
# Source Code Management: Git
# -------------------------------------
# Repository URL: https://github.com/alejoceballos/jack-ketch-4-flow.git
# Add Credentials
#   Kind: Username with password
#   Scope: Global (...)
#   Username: alejoceballos
#   Password: ************
# Branch Specifier (blank for 'any'): */master
# Repository browser: AUto
# _____________________________________
# Build
# -------------------------------------
# Root POM: jk4j/pom.xml
