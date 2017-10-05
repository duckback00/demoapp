<%@ page import="java.net.*" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jul 9, 2013, 1:06:39 PM
    Author     : vtigadi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ShowError.jsp" %>
<%
String serverIP = request.getLocalAddr();
String hostname, serverAddress;
hostname = "error";
serverAddress = "error";
try {
   InetAddress inetAddress;
   inetAddress = InetAddress.getLocalHost();
   hostname = inetAddress.getHostName();
   serverAddress = inetAddress.toString();
} catch (UnknownHostException e) {
   e.printStackTrace();
}
%>
<%@ include file="init.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--
        <link rel="stylesheet" type="text/css" href="style.css">
        --%>
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
        <title>Delphix Demo Applications</title>
        <link rel="shortcut icon" href="favicon.ico?v=3" />
        <style type="text/css">
            body {
                padding-top: 20px;
                padding-bottom: 60px;
            }

            .source {
                background-color: pink;
            }
            .target {
                background-color: brown;
            }

            /* Custom container */
            .container {
                margin: 0 auto;
                max-width: 1000px;
            }
            .container > hr {
                margin: 60px 0;
            }

            /* Main marketing message and sign up button */
            .jumbotron {
                margin: 80px 0;
                text-align: center;
            }
            .jumbotron h1 {
                font-size: 100px;
                line-height: 1;
            }
            .jumbotron .lead {
                font-size: 24px;
                line-height: 1.25;
            }
            .jumbotron .btn {
                font-size: 21px;
                padding: 14px 24px;
            }

            /* Supporting marketing content */
            .marketing {
                margin: 60px 0;
            }
            .marketing p + h4 {
                margin-top: 28px;
            }


            /* Customize the navbar links to be fill the entire space of the .navbar */ 
            .navbar .navbar-inner {
                padding: 0;
            }
            .navbar .nav {
                margin: 0;
                display: table;
                width: 100%;
            }
            .navbar .nav li {
                display: table-cell;
                width: 0%;
                float: none;
            }
            .navbar .nav li a {
                font-weight: bold;
                text-align: center;
                border-left: 1px solid rgba(255,255,255,.75);
                border-right: 1px solid rgba(0,0,0,.1);
            }
            .navbar .nav li:first-child a {
                border-left: 0;
                border-radius: 3px 0 0 3px;
            }
            .navbar .nav li:last-child a {
                border-right: 0;
                border-radius: 0 3px 3px 0;
            }
            
        </style>
        <link href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen"/>
    </head>
    <body>


<table border=0 style="background-color:black;width:100%;">
<tr>
<td width="33%" align="center" valign="top"><image src="img/logo.gif" /></td>
<td align="center">
<span style="font-size:18pt;"><font color="#CC3300">Welcome to Delphix Demo Applications</font></span>
</td>
</tr>
</table>

<hr size="3" color="teal" />

<center>
<table border=0 width="700" style="font-size:11pt;">

<tr>
<th>Database Vendor</th>
<th>Source Applications</th>
<th>Target Applications</th>
</tr>

<tr>
<td height=80 align="center"><image src="img/mssql_logo.png" width=125></td>
<td align="center">
<a href="redirect.jsp?dbType=mssql&dataSource=mssql_source&sqlUpper=yes">Landshark Micorsoft SQL Server Demo</a><br />
</td>
<td align="center">
<a href="redirect.jsp?dbType=mssql&dataSource=mssql_target&sqlUpper=yes">Target SQL Server Demo</a><br />
</td>
</tr>

<tr>
<td height=80 align="center"><image src="img/oracle_logo.png" width=125></td>
<td align="center">
<a href="redirect.jsp?sessionid=<%=sessionid%>&dbType=oracle&dataSource=oracle_source&sqlUpper=yes">Delphix Landshark Oracle Demo</a><br />
</td>
<td align="center">
<a href="redirect.jsp?sessionid=<%=sessionid%>&dbType=oracle&dataSource=oracle_target&sqlUpper=yes">Target Oracle Demo</a><br />
</td>
</tr>

<tr>
<td height=80 align="center"><image src="img/sybase_logo.png" width=125></td>
<td align="center">
<a href="redirect.jsp?dbType=sybase&dataSource=sybase_source&sqlUpper=yes">Delphix Landshark Sybase Demo</a><br />
</td>
<td align="center">
<a href="redirect.jsp?dbType=sybase&dataSource=sybase_target&sqlUpper=yes">Target Sybase Demo</a><br />
</td>
</tr>

<tr>
<td height=80 align="center"><image src="img/postgres_logo.png" width=125></td>
<td align="center">
<a href="redirect.jsp?dbType=postgresql&dataSource=postgresql_source&sqlSchema=delphixdb&sqlUpper=yes&sqlQuoted=yes">Delphix Landshark PostgreSQL Demo</a><br />
</td>
<td align="center">
<a href="redirect.jsp?dbType=postgresql&dataSource=postgresql_target&sqlSchema=delphixdb&sqlUpper=yes&sqlQuoted=yes">Target PostgreSQL Demo</a><br />
</td>
</tr>

<tr>
<td height=80 align="center"><image src="img/mysql_logo.png" width=125></td>
<td align="center">
<a href="redirect.jsp?dbType=mysql&dataSource=mysql_source&sqlUpper=yes">Delphix Landshark MySQL Demo</a><br /> 
<a href="redirect.jsp?dbType=mysql&dataSource=mysql_source"><font color=blue>(lower case)</font></a><br />
</td>
<td align="center">
<a href="redirect.jsp?dbType=mysql&dataSource=mysql_target&sqlUpper=yes">Target MySQL Demo</a><br />
<a href="redirect.jsp?dbType=mysql&dataSource=mysql_target"><font color=blue>(lower case)</font></a><br />
</td>
</tr>

</table>
</center>

<hr size="3" color="teal" />

<center>
<table border=0 width=700 style="font-size:10pt;">

<tr><td valign="top" width="50%">

<h4>Information Links</h4>
<a href="read_xml.jsp?sessionid=<%=sessionid%>">Configure Tomcat Database Connections</a><br />
<a href="redirect.jsp?reset=yes&page=index.jsp&sessionid=<%=sessionid%>">Reset Session Data</a><br />
<a href="README.txt" target="_new">README.txt</a><br />
Hostname: <%=hostname %><br />
Host IP Address: <%=serverIP %><br />
Host Operating System: <%=System.getProperty("os.name") %><br />
<br />

</td><td valign="top">

<h4>Delphix Engine Scripts</h4>
<a href="login.jsp" target="_blank">SelfService Login</a><br />
...<br />

</td></tr>
</table>
</center>

<hr size="3" color="teal" />


<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>  
<script src="./bootstrap/js/bootstrap.min.js"></script>  
<script src="./bootstrap/js/bootbox.min.js"></script>
</body>
</html>

