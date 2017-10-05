#############################################################################
#
# Create the file 
#
# /path_to_tomcat/bin/setenv.sh
#
# with the context below, update for your installation paths

#
# echo $PROP_FILE_HOME
# /path_to_tomcat/webapps/ROOT/WEB-INF/classes
#
PROP_FILE_HOME=/Users/abitterman/tomcat/webapps/ROOT/WEB-INF/classes
export PROP_FILE_HOME
echo "Verify/Update the Delphix connection parameters in the MyProp.properties in the path below"
echo "PROP_FILE_HOME=${PROP_FILE_HOME}"



#############################################################################
#
# Sample /path_to_tomcat/webapps/ROOT/WEB-INF/classes/MyProp.properties files
#
protocol=http
hostname=172.16.160.195
portno=80
username=delphix_admin
password=delphix

#
# HTTPS
#
protocol=https
hostname=172.16.160.195
portno=443
username=delphix_admin
password=delphix

#
# For multiple Engines, delimit parameters values with a comma
#
protocol=http,http
hostname=172.16.160.195,172.16.160.202
portno=80,80
username=delphix_admin,delphix_admin
password=delphix,landshark

