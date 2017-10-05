<%@ page import="java.io.*,java.sql.*,oracle.jdbc.driver.*,oracle.jdbc.OracleDriver,java.util.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String key = UUID.randomUUID().toString();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Self-service</title>
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            #logo {
                padding-top:  55px;
                padding-right: 0px;
                margin-right: 0px;
            }
            #heading {
                padding-top: 50px;
                margin-left: 15px;
                color: #006dcc;
            }
        </style>
            
    </head>
    <body>
        <div class="container">

            <div class="masthead">
                <div class="row">
                    <div class="span2" id="logo">
                        <img src="./img/logo_delphix_small.gif"/>
                    </div>
                    <div class="span4" id="heading">
                        <h3 class="pull-left">Database Self Service</h3>
                    </div>
                </div>
            </div>
            <hr>
            <br>
            <div class="row">
                <div class="span4 offset4">
                    <div class="well">
                        <legend>Please Login</legend>
                        <form method="POST" action="selfservice.jsp" accept-charset="UTF-8">
                            <input type="hidden" name="login" value="<%=key%>" />
                            <input class="span3" placeholder="Username" type="text" name="username" />
                            <input class="span3" placeholder="Password" type="password" name="password" />
                            <button class="btn-info btn" type="submit">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
