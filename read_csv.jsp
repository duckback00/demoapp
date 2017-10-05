<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.io.*, java.net.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Reading CSV File</title>
<link rel="shortcut icon" href="favicon.ico?v=3" />
</head>
<body>
<%

String fileName = "profile_connections.csv";
InputStream ins = application.getResourceAsStream(fileName);
//InputStream ins = this.getClass().getClassLoader().getResourceAsStream("META-INF/context.xml");
out.println("Filename: " + fileName + "<br /><pre>");
out.println("<div style=\"background-color:#DDDDDD;font-size:9pt;font-family:Courier,serif,sans-serif;\">");
int i = 0;
String hstr = "";
String dstr = "";
try {
   if(ins == null) {
     response.setStatus(response.SC_NOT_FOUND);
   } else {
      BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
      String data;
      String str;
      while((data= br.readLine())!= null) {
         i = i + 1;
         //out.println(data+"<br />");
         if (i <= 1) {
            hstr = data;
         } else {
            dstr = data;
         }
         out.println(data);
      }
   } 
} catch(IOException e) {
   out.println(e.getMessage());
}
ins.close();

out.println("</div>");

//
// Number of Rows (i) and Columns (cnt) in Multi-Dimensional Array ...
//
int cnt = hstr.length() - hstr.replace(",", "").length();
out.println(hstr + " " + i + " " + cnt);
String[][] cdata = new String[i][cnt];

//
// Header Array of Values ...
//
String[] arr = new String[cnt];
arr=hstr.split(",");
//for (String s: arr) { out.println(s); }

//
// Multi-Dimensional Array of Data ...
//
//InputStream 
ins = application.getResourceAsStream(fileName);
int j = -1;
try {
   BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
   String data;
   String str;
   while((data= br.readLine())!= null) {
      //out.println(j+") "+data+"<br />");
      if (j < 0) {
         hstr = data;
      } else {
         cdata[j] = data.split(",");
      }
      j = j + 1;
   }
} catch(IOException e) {
   out.println(e.getMessage());
}

//cdata[0] = dstr.split(",");
out.println("test "+cdata[3][2]+"<br />");


out.println("</pre>Done ...<br />");

%>

<center>
<form>
<input type="button" value="Close Window" onClick="window.close()">
</form>
</center>

</body>
</html> 
