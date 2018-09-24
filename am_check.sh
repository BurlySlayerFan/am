stat /opt/tomcats/tomcat_0/webapps/openam.war
if [ $? -eq 0 ]; then
    echo "AM is deployed"
else
    echo "AM not deployed. Deploying AM..."
    ./am_deploy.sh
fi
