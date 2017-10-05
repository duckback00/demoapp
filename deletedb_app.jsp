<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : deletedb
    Created on : Jul 16, 2013, 12:05:18 PM
    Author     : vtigadi
--%>

            
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Employee</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>

        <sql:update var="emp" dataSource="<%=session.getAttribute(\"dataSource\")%>">
<%
if ( session.getAttribute("employee_id").equals("YES") ) {
   if (session.getAttribute("dbType").equals("mysql")) {
   %>
      delete from employees where employee_id = '${param.empid}'
   <%
   } else {
   %>
      DELETE from EMPLOYEES where EMPLOYEE_ID = '${param.empid}'
   <%
   }
} else {
   if (session.getAttribute("dbType").equals("mysql")) {
   %>
      delete from employees where first_name = '${param.firstname}'
   <%
   } else {
   %>
      DELETE from EMPLOYEES where FIRST_NAME = '${param.firstname}'  
   <%
   }
}
%>
        </sql:update>   
        
        <c:redirect url="index_app.jsp?sessionid=${param.sessionid}" />
         
    </body>
</html>
