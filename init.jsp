<%@ page import="java.io.*,java.sql.*,oracle.jdbc.driver.*,oracle.jdbc.OracleDriver,java.util.*,javax.servlet.*,org.json.simple.*,org.json.simple.parser.*,java.net.*" %>
<%
String sessionid = "";
if (request.getParameter("sessionid") == null) {
   //session.invalidate();
   sessionid = UUID.randomUUID().toString();
} else {
   sessionid = (String) request.getParameter("sessionid");
}
String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
String cdsid = (String)session.getAttribute("cdsid");
//
// Application Pages ...
//
String marr[] = new String[3];
marr[0] = "index";
marr[1] = "index_app";
marr[2] = "masking_app";
//
// Rows per Page Selections ...
//
int arr[] = new int[10];
arr[0] = 5;
arr[1] = 10;
arr[2] = 20;
arr[3] = 25;
arr[4] = 50;
arr[5] = 100;
arr[6] = 200;
arr[7] = 500;
arr[8] = 1000;
arr[9] = 5000;
session.setAttribute("rows_per_page",arr);
int[] rows_per_page_arr = (int[])session.getAttribute("rows_per_page");
%>
<%@ include file="read_session.jsp" %>
