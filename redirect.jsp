<%@ page import="java.io.*,java.sql.*,oracle.jdbc.driver.*,oracle.jdbc.OracleDriver,java.util.*,javax.servlet.*,org.json.simple.*,org.json.simple.parser.*,java.net.*" %>
<%
String sessionid = "";
String pg = "index_app.jsp";

if (request.getParameter("sessionid") == null) {
   //session.invalidate();
   sessionid = UUID.randomUUID().toString();
} else {
   sessionid = (String) request.getParameter("sessionid");
}

//
// Logout ...
//
if (request.getParameter("logout") != null) {
   session.invalidate();
   response.sendRedirect("index.jsp?sessionid="+sessionid);
   return;
}
//
// Reset Session ...
//
if (request.getParameter("reset") != null) {
   String delfix = "";
   sessionid = (String) request.getParameter("sessionid");
   ///String uri = request.getRequestURI();
   ///String pageName = uri.substring(uri.lastIndexOf("/")+1);
   String cdsid = (String)session.getAttribute("cdsid");

   String path = "";
   String webRootPath = application.getRealPath("/").replace('\\', '/');
   // ... or ... webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
   //out.println("Path "+webRootPath+"<br />");
   path = webRootPath+"META-INF"+File.separator;
   //out.println("Path: "+path+"<br />");

   String sessionFilename = path+"session_"+cdsid+"_"+sessionid+".json";

   File sessionFile = new File(sessionFilename);
   //sessionFile.setWritable(true);
   if ( !sessionFile.delete() ) {
      out.println("Error in deleting file "+sessionFilename);
      delfix = "1";
   } else {
      out.println("File "+sessionFilename+" Deleted Successfully ...");
   }
   response.sendRedirect(""+request.getParameter("page")+"?sessionid="+sessionid+delfix);   //&filename="+sessionFilename);
   return;
}

//
// Login ...
//
if (request.getParameter("login") != null) {
   // put login code here ...
   String username=(String)request.getParameter("username");
   String password=(String)request.getParameter("password");
   //request.getSession(true);
   session.setAttribute("cdsid",username);
   sessionid=request.getParameter("login");
} else {
   sessionid=request.getParameter("sessionid");
}

// 
// Variables ...
//
String ds = "";
String msg = "";
String str = "";
/*
int arr[] = new int[8];
arr[0] = 5;
arr[1] = 10;
arr[2] = 20;
arr[3] = 25;
arr[4] = 50;
arr[5] = 100;
arr[6] = 200;
arr[7] = 500;
session.setAttribute("rows_per_page",arr);
*/

String sql[] = new String[6];
sql[0] = "select * from employees";   // sql_select_employees
// order by 1
sql[1] = "select patient_id,firstname,lastname,address,email,city,zipcode,social_security_number,phone_number from patient";  // sql_select_patient
sql[2] = "select patient_id,account_number,medical_record_number,phone_number,cc_number from patient_details";   // sql_select_patientdetails
sql[3] = "select patient_id,medical_record_number,address,phone_number,email from medical_records";    // sql_select_medicalrecords
sql[4] = "delete from employees where first_name =";    // sql_delete_employee
sql[5] = "insert into employees (first_name,last_name,dept_name,city) values ";   // sql_insert_newemp

//
// Reset Session Variables ...
//
session.setAttribute("sysMessage","");
session.setAttribute("dbSource","");
session.setAttribute("sql_select_employees","");
session.setAttribute("sql_select_patient","");
session.setAttribute("sql_select_patientdetails","");
session.setAttribute("sql_select_medicalrecords","");
session.setAttribute("sql_delete_employee","");
session.setAttribute("sql_insert_newemp","");

//
// Request Variables ...
//
String dbType = request.getParameter("dbType");
session.setAttribute("dbType",dbType);
String dataSource = request.getParameter("dataSource");
String sqlUpper = request.getParameter("sqlUpper");
String sqlSchema = request.getParameter("sqlSchema");
String sqlQuoted = request.getParameter("sqlQuoted");
 
if (dbType  != null) {
   //msg = "Hello <b>"+dbType+"</b>!";

   // 
   // Common SQL Code for numerous databases ...
   //
   if ( dbType.equals("mssql") || dbType.equals("sybase") || dbType.equals("mysql") || dbType.equals("oracle") ) {

      // 
      // Do Nothing ...
      //
      msg = "";

   } else if ( dbType.equals( "postgresql" ) ) {

      // 
      // PostgreSQL ...
      //
      if ( sqlSchema != null ) sqlSchema = sqlSchema+".";
      else sqlSchema = "";
      if ( sqlQuoted != null) sqlQuoted = "\"";
      else sqlQuoted = "";
      sql[0] = "select * from "+sqlSchema+sqlQuoted+"employees"+sqlQuoted;   // sql_select_employees
      sql[1] = "select "+sqlQuoted+"patient_id"+sqlQuoted+","+sqlQuoted+"firstname"+sqlQuoted+","+sqlQuoted+"lastname"+sqlQuoted+","+sqlQuoted+"address"+sqlQuoted+","+sqlQuoted+"email"+sqlQuoted+","+sqlQuoted+"city"+sqlQuoted+","+sqlQuoted+"social_security_number"+sqlQuoted+","+sqlQuoted+"phone_number"+sqlQuoted+" from "+sqlSchema+""+sqlQuoted+"patient"+sqlQuoted+"";   // sql_select_patient
      sql[2] = "select "+sqlQuoted+"patient_id"+sqlQuoted+","+sqlQuoted+"account_number"+sqlQuoted+","+sqlQuoted+"medical_record_number"+sqlQuoted+","+sqlQuoted+"phone_number"+sqlQuoted+","+sqlQuoted+"cc_number"+sqlQuoted+" from "+sqlSchema+""+sqlQuoted+"patient_details"+sqlQuoted+"";   // sql_select_patientdetails
      sql[3] = "select "+sqlQuoted+"patient_id"+sqlQuoted+","+sqlQuoted+"medical_record_number"+sqlQuoted+","+sqlQuoted+"address"+sqlQuoted+","+sqlQuoted+"phone_number"+sqlQuoted+","+sqlQuoted+"email"+sqlQuoted+" from "+sqlSchema+""+sqlQuoted+"medical_records"+sqlQuoted+"";    // sql_select_medicalrecords
      sql[4] = "delete from "+sqlSchema+""+sqlQuoted+"employees"+sqlQuoted+" where "+sqlQuoted+"first_name"+sqlQuoted+" =";    // sql_delete_employee
      sql[5] = "insert into "+sqlSchema+""+sqlQuoted+"employees"+sqlQuoted+" ("+sqlQuoted+"first_name"+sqlQuoted+","+sqlQuoted+"last_name"+sqlQuoted+","+sqlQuoted+"dept_name"+sqlQuoted+","+sqlQuoted+"city"+sqlQuoted+") values ";   // sql_insert_newemp

   } else {
      // 
      // Unknown dbType ... 
      // 
      pg = "index.jsp";
   }

   //
   // Upper Case SQL option ...
   //
   if ( sqlUpper != null ) {
      int i = 0;
      for ( String str1 : sql ) {
         str1 = str1.toUpperCase();
         sql[i] = str1;
         i = i + 1;
      }
   }

   ////////////////////////////////////////////////////

   //
   // HTML Banner ...
   // 
   String ban = "<center><table border=0 style=\"background-color:black;width:100%;\">\n";
   ban = ban + "<tr><td style=\"padding-left:100px;\" width=\"30%\" align=\"center\" valign=\"top\"><a href=\"redirect.jsp?sessionid="+sessionid+"&logout=yes\"><image src=\"img/logo.gif\" border=0 /></a></td>\n";
   ban = ban + "<td align=\"center\" width=\"140\" valign=\"middle\"><image src=\"img/"+dbType+"_logo.png\" width=\"100\" border=0 /></td>\n";
   ban = ban + "<td align=\"left\" valign=\"bottom\"><span style=\"padding-left:10px;font-size:14pt;\"><font color=\"#CC3300\">Delphix <font color=white><b>"+dataSource+"</b></font> Demo Application</font></span></td>\n";
   ban = ban + "</tr>\n";
   //if (msg != null) {
   //  ban = ban + "<tr style=\"background-color:white;width:100%;\"><td align=\"right\" style=\"color:blue;\"><i>:System Message:</i></td><td colspan=2>"+msg+"</td></tr>\n";
   //}
   ban = ban + "</table></center>\n";
   if (request.getParameter("banner") != null) {
      if (request.getParameter("banner").equals("no")) {
         ban = "";
      }
   }
   session.setAttribute("html_banner",ban);
   //
   // Source or Target Database Connection ...
   //
   if ( dataSource != null) ds="jdbc/"+dataSource;
   else msg = msg+"<br /><font color=\"red\">Missing dataSource ...</font>";
   session.setAttribute("dataSource",ds);

   //
   // Employee Page ...
   //
   session.setAttribute("sql_select_employees",sql[0]);

   //
   // Masking Page ...
   //
   session.setAttribute("sql_select_patient",sql[1]);
   session.setAttribute("sql_select_patientdetails",sql[2]);
   session.setAttribute("sql_select_medicalrecords",sql[3]);

   //
   // Delete Page ...
   //
   session.setAttribute("sql_delete_employee",sql[4]); 

   //
   // Insert Page ...
   //
   session.setAttribute("sql_insert_newemp",sql[5]);

} else {
   //
   // System Message ...
   //
   msg = "Error: Missing Parameters ...<br />";
   session.setAttribute("sysMessage",msg);
   pg = "index.jsp";
}

//
// Redirect URL ...
//
response.sendRedirect(pg+"?sessionid="+sessionid);
%>
