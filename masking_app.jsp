<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jul 9, 2013, 1:06:39 PM
    Author     : vtigadi

sql[1] = "select patient_id,firstname,lastname,address,email,city,zipcode,social_security_number,phone_number,rownum as rnum,count(*) over () as cnt from patient";  // sql_select_patient
<%=session.getAttribute("sql_select_patient")%>

--%>
<%@ include file="init.jsp" %>
<%@ include file="include_page_calcs.jsp" %>

<%
String sql = "";
if (session.getAttribute("dbType").equals("oracle")) {
   sql = "select c.* from (";
   sql = sql + "select a.*, count(*) over () as cnt from (";
   sql = sql + "select b.*, rownum as rnum from (";
   sql = sql + "select patient_id,firstname,lastname,address,email,city,zipcode,social_security_number,phone_number from patient" + sorder + " " + sortname + " " + sortdirection;
   sql = sql + ") b";
   sql = sql + ") a";
   sql = sql + ") c";
   sql = sql + " where rnum between " + istart + " and " + iend + "";
   if (isearch != null && !isearch.equals("")) {
      isearch = isearch.toLowerCase();
      sql = "select c.* from (";
      sql = sql + "select a.*, count(*) over () as cnt from (";
      sql = sql + "select b.*, rownum as rnum from (";
      sql = sql + "select patient_id,firstname,lastname,address,email,city,zipcode,social_security_number,phone_number from patient";
      sql = sql + " WHERE lower(firstname) like '%"+isearch+"%'";
      sql = sql + " OR lower(lastname) like '%"+isearch+"%'";
      sql = sql + " OR lower(address) like '%"+isearch+"%'";
      sql = sql + " OR lower(email) like '%"+isearch+"%'";
      sql = sql + " OR lower(city) like '%"+isearch+"%'";
      sql = sql + " OR lower(zipcode) like '%"+isearch+"%'";
      sql = sql + " OR lower(social_security_number) like '%"+isearch+"%'";
      sql = sql + " OR lower(phone_number) like '%"+isearch+"%'";
      sql = sql + sorder + " " + sortname + " " + sortdirection;
      sql = sql + ") b";
      sql = sql + ") a";
      sql = sql + ") c";
      sql = sql + " where rnum between " + istart + " and " + iend + "";
   }
} else {
   sql = (String) session.getAttribute("sql_select_patient");
}
//out.println("SQL> "+sql+"<br />");
%>

<sql:query var="patient" dataSource="<%=session.getAttribute(\"dataSource\")%>">
<%=sql%>
</sql:query>

<sql:query var="patientdetails" dataSource="<%=session.getAttribute(\"dataSource\")%>">
   <%=session.getAttribute("sql_select_patientdetails")%>
</sql:query>

<sql:query var="medicalrecords" dataSource="<%=session.getAttribute(\"dataSource\")%>">
   <%=session.getAttribute("sql_select_medicalrecords")%>
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ShowError.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%--
        <link rel="stylesheet" type="text/css" href="style.css">
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
        --%>
        <link href="./bootstrap/css/bootstrap1.min.css" rel="stylesheet" media="screen"/>
        <title>Unmasked Data</title>
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

        <!--
        <script>
            function validateInput()
            {
                var firstname = document.getElementById("FIRSTNAME").value;
                var lastname = document.getElementById("LASTNAME").value;
                var deptname = document.getElementById("DEPTNAME").value;
                var city = document.getElementById("CITY").value;
                
                if (firstname == "" || lastname == "" || deptname == "" || city == "")
                {
                    bootbox.alert("One or more input fields are empty!");
                    return false;
                }
            }
            
        </script>
        -->

        <div class="container">
            <div class="row">
                <div class="span10">
                    <div class="masthead">
                        <h3 class="muted">Delphix Demo</h3>
                        <div class="navbar">
                            <div class="navbar-inner">
                                <div class="container">
                                    <ul class="nav">
                                        <li><a href="index_app.jsp?sessionid=<%=sessionid%>">Home</a></li>
                                        <li class="active"><a href="masking_app.jsp?sessionid=<%=sessionid%>">Masking</a><li> 
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
<a href="#pat_rec">Patient Records</a>&nbsp;&nbsp;--&nbsp;&nbsp;<a href="#pat_det">Patient Details</a>&nbsp;&nbsp;--&nbsp;&nbsp;<a href="#med_rec">Medical Records</a>


<table border=0 width="100%" style="border-collapse:collapse;"><tr><td><h3>Patient Records</h3></td>
<%
if (session.getAttribute("dbType").equals("oracle")) {
%>
<%@ include file="include_page_html.jsp" %>
<%
}
%>
<td align="right"><a href="#top"><image src="images/back2top-icon-2.gif" height="30px" border=0 alt="Back to Top" /></a></td></tr></table>


            <div class="row">
                <div class="span10"><a name="pat_rec"></a>



                    <table style="font-size:10pt;" class="table table-striped" id="PatientTable">
                        <!-- column headers -->
                        <tr>
                            <c:forEach var="columnName" items="${patient.columnNames}">
<c:set var="myTest" value="${columnName}"/>
<%
String name=pageContext.getAttribute("myTest").toString();
if (session.getAttribute("dbType").equals("oracle")) {
%>
<%@ include file="include_page_sort.jsp"%>
<%
}
%>
                            </c:forEach>
<!--
                                <th><c:out value="${columnName}"/></th>

                            <th>Patient ID</th>
                            <th>First Name </th>
                            <th>Last Name</th>
                            <th>Address</th>
                            <th>City</th> 
                            <th>Zip</th>
                            <th>Email</th>
                            <th>SSN</th>
                            <th>Phone</th>
-->  
                      </tr>
                        <!-- column data -->
                        <c:forEach var="row" items="${patient.rows}">
                            <tr>
                                <c:forEach var="columnName" items="${patient.columnNames}">
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



        <div class='container'>
            <div class="row">
                <div class="span10"><a name="pat_det"></a>
                    <table border=0 width="100%"><tr><td><h3>Patient Details</h3></td><td align="right"><a href="#top"><image src="images/back2top-icon-2.gif" height="30px" border=0 alt="Back to Top" /></a></td></tr></table>
                    <table class="table table-striped" id="PatientDetailsTable">
                        <!-- column headers -->
                        <tr>
                            <%--
                            <c:forEach var="columnName" items="${employees.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                            --%>
                            <th>Patient ID</th>
                            <th>Medical Record No</th>
                            <th>Account No</th>
                            <th>Phone Number</th>             
                            <th>CC Number</th>             
                        </tr>
                        <!-- column data -->
                        <c:forEach var="row" items="${patientdetails.rowsByIndex}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
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


        <div class='container'>
            <div class="row">
                <div class="span10"><a name="med_rec"></a>
                    <table border=0 width="100%"><tr><td><h3>Medical Records</h3></td><td align="right"><a href="#top"><image src="images/back2top-icon-2.gif" height="30px" border=0 alt="Back to Top" /></a></td></tr></table>
                    <table class="table table-striped" id="MedicalRecordsTable">
                        <!-- column headers -->
                        <tr>
                            <%--
                            <c:forEach var="columnName" items="${employees.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                                </c:forEach>
                            --%>
                            <th>Patient ID</th>
                            <th>Medical Record No</th>
                            <th>Address</th>
                            <th>Phone Number</th>             
                            <th>Email</th>             
                        </tr>
                        <!-- column data -->
                        <c:forEach var="row" items="${medicalrecords.rowsByIndex}">
                            <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
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


        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery.js"></script>  
        <script src="./bootstrap/js/bootstrap.min.js"></script>  
        <script src="./bootstrap/js/bootbox.min.js"></script>

<%@ include file="footer.jsp" %>

