
The application directory "demoapp" contains the Java Server Pages (JSP) set
of Delphix Employee and Medical Application for MS SQL Server, 
MySQL, PostgreSQL, Sybase and Oracle Databases. 

Also included is a sample self-service application to demonstrate
the power of Delphix API's.    See  README_SelfService.txt

-----------------------------------------------------------------------
-- Installation  Notes --
-------------------------

1.)  Unzip application file into an existing working Tomcat application 
environment

cp demoapp_v#.zip /path_to_tomcat/webapps/.
cd /path_to_tomcat/webapps
unzip demoapp_v#.zip 

# verify files

2.)  Copy the demoapp/json-simple-1.1.jar to your tomcat application library

3.)  [Optional] Rename demoapp directory and/or mv conents to an new directory if desired.

4.)  Update / change database connection information
     -- see inforamtion below

5.)  Create database tables/data  if required, see DDL/SQL within the sql directory of the application.
     NOTE:  This application supports both the EMPLOYEE demo databases, with and without
     the EMPLOYEE_ID column/primary key

6.)  Open web browser to 
     http://localhost:8080/[application_directory]/index.jsp

# Examples ...
http://localhost:8080/demoapp/index.jsp

#
# Start application  directly into Employee/Medical Records Page without HTML header banner ...
#
# Source ...
http://localhost:8080/demoapp/redirect.jsp?sessionid=mysession&dbType=oracle&dataSource=oracle_source&sqlUpper=yes&banner=no
# Target ...
http://localhost:8080/demoapp/redirect.jsp?sessionid=mysession&dbType=oracle&dataSource=oracle_target&sqlUpper=yes&banner=no

7.)  For Database Self Service, please see README_SelfService.txt


-----------------------------------------------------------------------
-- Applications Notes --
------------------------

For ALL applications, verify that the source database has the correct 
protocols enabled and is accessible from "this computer" hosting this
set of applications. 

For Self-Service, verfiy that "this computer" has access to the Delphix Engine URL;

http://<delphix_engine>:80/
... and/or ...
https://<delphix_engine>:443/

-----------------------------------------------------------------------
--
-- Database Connections ...
--
The database connections are defined in the application META-INF/context.xml file.

For example: 
  C:\path_to_tomcat\webapps\[application_directory]\META-INF\context.xml
  /path_to_tomcat/webapps/[application_directory]/META-INF/context.xml

The application will make changes to this file from the respective web page! 

http://localhost:8080/[application_directory]/read_xml.jsp
i.e. if installed in the /path_to_tomcat/webapps/demoapp directory
http://localhost:8080/demoapp/read_xml.jsp

-----------------------------------------------------------------------
--
-- Starting / Stopping Tomcat Server ...
--

Windows:  C:\apache*tomcat*/bin/shutdown.bat
          C:\apache*tomcat*/bin/startup.bat
Linux:    /path_to/tomcat/bin/shutdown.sh 
          /path_to/tomcat/bin/startup.sh 



JSP Files
=========
index.jsp     		-> Main Page with Application links to Vendor Databases 
index_app.jsp 		-> Employee Listing Page 
masking_app.jsp  	-> Masking Medical Records and Patient Page
insertdb_app.jsp        -> Database Insert/Update Records
deletedb_app.jsp	-> Database Delete Records

read_xml.jsp		-> Read/Write context.xml file
read_context.jsp        -> Read Context XML file and web page display

redirect.jsp		-> Used to logout, clear session variables and redirect to target page

selfservice.jsp		-> Selfservice Sample Demo Application
provision.jsp		-> Provision Parameters 
WEB-INF			-> Selfservice Supporting Java Application




Tomcat Database Jar Files 
=========================
Oracle        ->  ojdbc6.jar
MySQL         ->  mysql-connector-java-5.1.36-bin.jar
Sybase        ->  jtds-1.3.1.jar
PostgreSQL    ->  postgresql-9.4-1201.jdbc41.jar
MS SQL Server ->  sqljdbc42.jar




-----------------------------------------------------------------------
-- Microsoft SQL Server --
--------------------------

Verify that the source Microsoft SQL Server has TCPIP protocol is enabled, 
no firewall restrictions and source port number, typically 1433


-----------------------------------------------------------------------
-- MySQL --
-----------

The source MySQL Database must support network connections. THE FOLLOWING changes
are REQUIRED to allow network access from the MySQL Database Server.

NOTE: These changes are DONE on the Server running the MySQL Database.



The default my.ini file required changes to allow network connections are:

# Change here for bind listening, use the MySQL server IP address 
bind-address="172.16.160.126" 

#skip-networking

Verify MySQL Port in the my.ini file, typically 3306



And the database user must have '%' host access or specific client ip host access.

CREATE USER 'delphixdb'@'%' IDENTIFIED BY 'delphixdb';
GRANT USAGE ON *.* TO 'delphixdb'@'%' IDENTIFIED BY 'delphixdb' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON 'delphixdb'.* TO 'delphixdb'@'%';

CREATE USER 'delphixdb'@'localhost' IDENTIFIED BY 'delphixdb';
GRANT USAGE ON *.* TO 'delphixdb'@'localhost' IDENTIFIED BY 'delphixdb' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

SQL> FLUSH PRIVILEGES;


-----------------------------------------------------------------------
-- PostgreSQL --
----------------

The default pg_hba.conf file required changes to allow network connections.

NOTE: These changes are DONE on the Server running the PostgreSQL Database.

Use the IP address subnet for your client connections.

	
host    all             all             172.16.160.0/24   	trust


-----------------------------------------------------------------------
-- Oracle --
------------

Access to listener port from database,  tnsping [SID] or [SERVICE_NAME]
i.e.  tnsping orcl



*** End of Readme Notes ***

