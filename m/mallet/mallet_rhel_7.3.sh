# ----------------------------------------------------------------------------
#
# Package	: mallet
# Version	: 2.0
# Source repo	: https://github.com/mimno/Mallet.git
# Tested on	: rhel_7.3
# Script License: Apache License, Version 2 or later
# Maintainer	: Atul Sowani <sowania@us.ibm.com>
#
# Disclaimer: This script has been tested in non-root mode on given
# ==========  platform using the mentioned version of the package.
#             It may not work as expected with newer versions of the
#             package and/or distribution. In such case, please
#             contact "Maintainer" of this script.
#
# ----------------------------------------------------------------------------

#!/bin/bash

# Install dependencies.
sudo yum install -y git java-1.7.0-openjdk-devel.ppc64le ant
export JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk"

# Clone and build source.
git clone https://github.com/mimno/Mallet.git
cd Mallet
ant
