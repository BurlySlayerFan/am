is_tomcat_running () {
pgrep -F /opt/tomcats/tomcat_0/tomcat.pid
}

/opt/tomcats/tomcat_0/bin/shutdown.sh 10
is_tomcat_running
while [ $? -eq 0 ]; do
sleep 5s
echo "Checking if tomcat is still running..."
is_tomcat_running
kill -9 $(cat /opt/tomcats/tomcat_0/tomcat.pid)
done
echo "tomcat has stopped."
rm -rf /opt/tomcats/tomcat_0/webapps/openam*
rm -rf /opt/tomcats/tomcat_0/work/Catalina/localhost/openam/
rm -rf ~/.openamcfg
rm -rf ~/openam
echo "tomcat removed. Use am_deploy.sh to begin reinstallation AM."
