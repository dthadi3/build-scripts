# ----------------------------------------------------------------------------
#
# Package			: exp4j
# Version			: 0.4.8
# Source repo		: https://github.com/fasseg/exp4j
# Tested on			: RHEL 7.6
# Script License	: Apache License Version 2.0
# Maintainer		: Pratham Murkute <prathamm@us.ibm.com>
#
# Disclaimer: This script has been tested in root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#			  
# ----------------------------------------------------------------------------

#!/bin/bash

# install tools and dependent packages
#yum -y update
yum install -y git wget curl unzip nano vim make build-essential dos2unix
#yum install -y gcc ant

# setup java environment
yum install -y java java-devel
which java
ls /usr/lib/jvm/
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-ibm-1.8.0.6.5-1jpp.1.el7.ppc64le
# update the path env. variable 
export PATH=$PATH:$JAVA_HOME/bin

# install maven
MAVEN_VERSION=3.6.3
wget http://mirrors.estointernet.in/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
ls /usr/local
tar -C /usr/local/ -xzf apache-maven-$MAVEN_VERSION-bin.tar.gz
mv /usr/local/apache-maven-$MAVEN_VERSION /usr/local/maven
ls /usr/local
rm apache-maven-$MAVEN_VERSION-bin.tar.gz
export M2_HOME=/usr/local/maven
# update the path env. variable 
export PATH=$PATH:$M2_HOME/bin

# create folder for saving logs 
mkdir -p /logs

# variables
PKG_NAME="exp4j"
PKG_VERSION=0.4.8
PKG_VERSION_LATEST=0.4.8
LOGS_DIRECTORY=/logs
LOCAL_DIRECTORY=/root
REPOSITORY="https://github.com/fasseg/exp4j.git"

# clone, build and test specified version
cd $LOCAL_DIRECTORY
git clone $REPOSITORY $PKG_NAME-$PKG_VERSION
cd $PKG_NAME-$PKG_VERSION/
git checkout -b $PKG_VERSION tags/$PKG_NAME-$PKG_VERSION
mvn -Dgpg.skip=true clean install | tee $LOGS_DIRECTORY/$PKG_NAME-$PKG_VERSION.txt

# clone, build and test master
#cd $LOCAL_DIRECTORY
#git clone $REPOSITORY $PKG_NAME-master
#cd $PKG_NAME-master/
#mvn -Dgpg.skip=true clean install | tee $LOGS_DIRECTORY/$PKG_NAME.txt
