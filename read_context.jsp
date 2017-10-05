<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Reading Text File</title>
<link rel="shortcut icon" href="favicon.ico?v=3" />
</head>
<body>
<%

String fileName = "/META-INF/context.xml";
InputStream ins = application.getResourceAsStream(fileName);
//InputStream ins = this.getClass().getClassLoader().getResourceAsStream("META-INF/context.xml");
out.println("Filename: " + fileName + "<br /><pre>");
out.println("<div style=\"background-color:#DDDDDD;font-size:9pt;font-family:Courier,serif,sans-serif;\">");
try {
   if(ins == null) {
     response.setStatus(response.SC_NOT_FOUND);
   } else {
      BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
      String data;
      String str;
      while((data= br.readLine())!= null) {
         //out.println(data+"<br />");
         str = data.replace("<","&lt;").replace(">","&gt;");
         out.println(str);
      }
   } 
} catch(IOException e) {
   out.println(e.getMessage());
}

out.println("</div>");
out.println("</pre>Done ...<br />");

%>

<center>
<form>
<input type="button" value="Close Window" onClick="window.close()">
</form>
</center>

</body>
</html> 
