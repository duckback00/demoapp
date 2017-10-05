<%-- 
    Document   : ShowError.jsp
    Created on : Aug 1, 2013, 9:40:03 PM
    Author     : vtigadi
--%>
<%@page isErrorPage="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
        <link href="./bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen"/>
        <style type="text/css">
            body {
                padding-top: 20px;
                padding-bottom: 60px;
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
                width: 1%;
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
        <title>Error Page</title>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="span10">
                    <div class="alert alert-danger alert-block">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <h2>Error !</h2> 
                        <p><pre>
                            ${pageContext.exception}
                        </pre>
                    </p>
                    </div>
                </div>
            </div>
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>  
        <script src="./bootstrap/js/bootstrap.min.js"></script>  
    </body>
</html>
