<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jul 9, 2013, 1:06:39 PM
    Author     : vtigadi


http://127.0.0.1:8080/index_mysql_lc.jsp?dataSource=jdbc%2Fmysql
jdbc/mysql

    <%=session.getAttribute("sql_select_employees")%>

--%>

<%@ include file="init.jsp" %>
<%@ include file="include_page_calcs.jsp" %>

<%
String sql = "";
session.setAttribute("employee_id","NO");
if (session.getAttribute("dbType").equals("oracle")) {
   sql = "select c.* from (";
   sql = sql + "select a.*, count(*) over () as cnt from (";
   sql = sql + "select b.*, rownum as rnum from (";
   sql = sql + "select * from employees" + sorder + " " + sortname + " " + sortdirection;
   sql = sql + ") b";
   sql = sql + ") a";
   sql = sql + ") c";
   sql = sql + " where rnum between " + istart + " and " + iend + "";
   if (isearch != null && !isearch.equals("")) {
      isearch = isearch.toLowerCase();
      sql = "select c.* from (";
      sql = sql + "select a.*, count(*) over () as cnt from (";
      sql = sql + "select b.*, rownum as rnum from (";
      sql = sql + "select * from employees";
      sql = sql + " WHERE lower(first_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(last_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(dept_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(city) like '%"+isearch+"%'";
      sql = sql + sorder + " " + sortname + " " + sortdirection;
      sql = sql + ") b";
      sql = sql + ") a";
      sql = sql + ") c";
      sql = sql + " where rnum between " + istart + " and " + iend + "";
   }
} else if (session.getAttribute("dbType").equals("mssql")) {
   //select [EMPLOYEE_ID] ,[FIRST_NAME] ,[LAST_NAME] ,[DEPT_NAME] ,[CITY] , ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) AS RNUM , COUNT(*) OVER () as ICNT from EMPLOYEES
   sql = "select c.* from (";
   sql = sql + "select * ";
   if (sorder.equals("")) {
      sql = sql + ", ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) AS RNUM, COUNT(*) OVER () as CNT ";
   } else {
      sql = sql + ", ROW_NUMBER() OVER(ORDER BY "+sortname+" "+sortdirection+") AS RNUM, COUNT(*) OVER () as CNT ";
   }
   sql = sql + " from EMPLOYEES ";
//   sql = sql + sorder + " " + sortname + " " + sortdirection;
   sql = sql + ") c";
   sql = sql + " where RNUM between " + istart + " and " + iend + "";
   if (isearch != null && !isearch.equals("")) {
      isearch = isearch.toLowerCase();
      sql = "select c.* from (";
      sql = sql + "select * ";
      if (sorder.equals("")) {
         sql = sql + ", ROW_NUMBER() OVER(ORDER BY EMPLOYEE_ID ASC) AS RNUM, COUNT(*) OVER () as CNT ";
      } else {
         sql = sql + ", ROW_NUMBER() OVER(ORDER BY "+sortname+" "+sortdirection+") AS RNUM, COUNT(*) OVER () as CNT ";
      }
      sql = sql + " from employees";
      sql = sql + " WHERE lower(first_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(last_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(dept_name) like '%"+isearch+"%'";
      sql = sql + " OR lower(city) like '%"+isearch+"%'";
//      sql = sql + sorder + " " + sortname + " " + sortdirection;
      sql = sql + ") c";
      sql = sql + " where RNUM between " + istart + " and " + iend + "";
   }
} else if (session.getAttribute("dbType").equals("mysql")) {
   sql = (String) session.getAttribute("sql_select_employees");
   //istart = istart - 1;
   //sql = "select * from employees limit " + istart + "," + icnt; // + " "+itotal+" "+noPages;
} else {
   sql = (String) session.getAttribute("sql_select_employees"); 
}
//out.println("SQL> "+sql+"<br />");
%>

<sql:query var="employees" dataSource="<%=session.getAttribute(\"dataSource\")%>">
<%=sql%>
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ShowError.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--
        <link rel="stylesheet" type="text/css" href="style.css">
        --%>
        <link href="./bootstrap/css/bootstrap1.min.css" rel="stylesheet" media="screen"/>
        <title><%=session.getAttribute("page_title")%></title>
        <style type="text/css">
            body {
                padding-top: 20px;
                padding-bottom: 20px;
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

    <a name="top"></a>
    <%=session.getAttribute("html_banner")%>

        <script>
            function validateInput()
            {
                var empid = document.getElementById("empid").value;
                var firstname = document.getElementById("firstname").value;
                var lastname = document.getElementById("lastname").value;
                var deptname = document.getElementById("deptname").value;
                var city = document.getElementById("city").value;
                
                if (empid == "" || firstname == "" || lastname == "" || deptname == "" || city == "")
                {
                    bootbox.alert("One or more input fields are empty!");
                    return false;
                }
            }            
        </script>

        <div class="container">
            <div class="row">
                <div class="span10">
                    <div class="masthead">
                        <h3 class="muted">Delphix Demo</h3>
                        <div class="navbar">
                            <div class="navbar-inner">
                                <div class="container">
                                    <ul class="nav">
                                        <li class="active"><a href="index_app.jsp?sessionid=<%=sessionid%>">Home</a></li>
                                        <li><a href="masking_app.jsp?sessionid=<%=sessionid%>">Masking</a><li> 
                                        <li><a href="login.jsp">Self Service</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div><!-- /.navbar -->
                    </div>
                </div>
                <div class="span2">
                </div>
            </div>
        </div>

        <div class='container'>


<table border=0 width="100%" style="border-collapse:collapse;"><tr><td><h3>Employees</h3></td>
<%@ include file="include_page_html.jsp" %>
<td>&nbsp;&nbsp;&nbsp;&nbsp;</td><!--td align="right"><a href="#top"><image src="images/back2top-icon-2.gif" height="30px" border=0 alt="Back to Top" /></a></td--></tr></table>


            <div class="row">
                <div class="span10">

                    <table id="" class="table table-striped">
                        <!-- column headers -->
                        <tr>
                            <c:forEach var="columnName" items="${employees.columnNames}">
<c:set var="myTest" value="${columnName}"/>
<%
String name=pageContext.getAttribute("myTest").toString();
if (name.equals("EMPLOYEE_ID")) {
   session.setAttribute("employee_id","YES");
}
// out.println("empid "+session.getAttribute("employee_id")+"<br />");
%>
<%@ include file="include_page_sort.jsp"%>
                                </c:forEach>
                        </tr>
                        <!-- column data -->
                        <c:forEach var="row" items="${employees.rows}">
                            <tr>
                                <c:forEach var="columnName" items="${employees.columnNames}">
                                    <c:set var="myTest" value="${columnName}"/>
                                    <c:set var="myVal" value="${row[columnName]}"/>

                                    <%
                                    String ztmp = "";
                                    %>
                                    <c:choose> 
                                       <c:when test="${not empty myVal}">
                                       <%
                                       String strStr=pageContext.getAttribute("myTest").toString();
                                       String strVal = pageContext.getAttribute("myVal").toString();
                                       ztmp = strVal;
                                       if (strStr.equals("CNT")) {
                                          //out.println("yeah"+strVal+":");
                                          itotal = Integer.parseInt(strVal);
                                       }
                                       if ( !strStr.equals("RNUM") && !strStr.equals("CNT") ) {
                                          if (isearch != null && !isearch.equals("") ) {
                                             if (ztmp != null) {
                                                if (ztmp.toLowerCase().contains(isearch)) {
                                                   ztmp = "<font color=red>"+ztmp+"</font>";
                                                }
                                             }
                                          }
                                          //${row[columnName]}
                                          %>
                                          <td><c:out value="<%=ztmp%>" escapeXml="false"/></td>
                                          <%
                                       }
                                       %>
                                       </c:when>
                                       <c:otherwise>
                                          <td><c:out value="<%=ztmp%>" escapeXml="false"/></td>
                                       </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </tr>
                        </c:forEach>

                    </table>
                    <br/>
                    <br/>
                </div>
                <div class="span2">
                </div>
            </div>
        </div>


        <div class="container">
            <div class="row">
                <div class="span5">
                    <form class="form-horizontal" onsubmit="return validateInput()" action="insertdb_app.jsp?sessionid=<%=sessionid%>" method="POST">
                        <fieldset>
                            <legend> Add Employee </legend>
<% 
if ( session.getAttribute("employee_id").equals("YES") && ( session.getAttribute("dbType").equals("oracle") || session.getAttribute("dbType").equals("mssql") ) ) {
%>
                            <div class="control-group">
                                <label class="control-label" for="empid">Employee ID</label>
                                <div class="controls">
                                    <input type="text" name="empid" id="empid" placeholder="empid">
                                </div>
                            </div>
<%
} else { 
%>
<input type="hidden" name="empid" id="empid" placeholder="empid" value="NA" />
<%
}
%>
                            <div class="control-group">
                                <label class="control-label" for="firstname">First Name</label>
                                <div class="controls">
                                    <input type="text" name="firstname" id="firstname" placeholder="firstname">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="lastname">Last Name</label>
                                <div class="controls">
                                    <input type="text" name="lastname" id="lastname" placeholder="lastname">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="deptname">Dept Name</label>
                                <div class="controls">
                                    <input type="text" name="deptname" id="deptname" placeholder="dept">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="city">City</label>
                                <div class="controls">
                                    <input type="text" name="city" id="city" placeholder="city">
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-inverse">Add</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <div class="span5">
                    <form class="form-horizontal"action="deletedb_app.jsp?sessionid=<%=sessionid%>" method="POST">                                               
                        <fieldset>
                            <legend> Remove Employee </legend>
                            <div class="control-group">
<% 
if ( session.getAttribute("employee_id").equals("YES") ) {
%>
                                <label class="control-label" for="empid">Employee ID</label>
                                <div class="controls">
                                    <input type="text" name="empid" placeholder="empid">
                                </div>
<%
} else {
%>
                                <label class="control-label" for="firstname">First Name</label>
                                <div class="controls">
                                    <input type="text" name="firstname" placeholder="firstname">
                                </div>
<%
}
%>
                            </div> 
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn btn-inverse">Delete</button>
                                </div>
                            </div>                      
                        </fieldset>                       
                    </form>
                    <br/>
                    <br/> 
                </div>
            </div>
        </div>
<!--
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>  
-->
        <script src="./bootstrap/js/bootstrap.min.js"></script>  
        <script src="./bootstrap/js/bootbox.min.js"></script>

<%@ include file="footer.jsp" %>

