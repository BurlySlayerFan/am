#!/bin/bash

echo "Which AM version (Enter full filename, default AM-6.0.0.war)?"
read am_version
am_version=${am_version:-AM-6.0.0}
cp ~/Downloads/$am_version.war /opt/tomcats/tomcat_0/webapps/openam.war
/opt/tomcats/tomcat_0/bin/startup.sh
# maybe run the am_install script after this
