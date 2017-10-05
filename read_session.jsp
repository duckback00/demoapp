<%
//
// Application Variables ...
//
int icnt = 0;
int ipage = 0;
int itotal = 0;
String isearch = "";
String sortname = "";
String sortdirection = "";
String ifilter = "";
String json_default = "{ \"session_name\": \"default\" ,\"cdsid\": \"ezstore\" ,\"pages\": { \"index.jsp\": { \"icnt\": 5 , \"ipage\": 1 , \"itotal\": 0 , \"sortname\": \"\" , \"sortdirection\": \"\" , \"isearch\": \"\" , \"ifilter\": {\"\": \"\"} } , \"index_app.jsp\": { \"icnt\": 10 , \"ipage\": 1 , \"itotal\": 1000 , \"sortname\": \"\" , \"sortdirection\": \"ASC\" , \"isearch\": \"\" , \"ifilter\": {\"\": \"\"} } , \"masking_app.jsp\": { \"icnt\": 10 , \"ipage\": 1 , \"itotal\": 1000 , \"sortname\": \"\" , \"sortdirection\": \"ASC\" , \"isearch\": \"\" , \"ifilter\": {\"\": \"\"} } } } ";

//out.println("sessionid: "+sessionid+" cdsid: "+cdsid+" pageName:"+pageName+"<br />");

//
// Session File Information ...
//
String path = "";
String webRootPath = application.getRealPath("/").replace('\\', '/');
// ... or ... webRootPath = getServletContext().getRealPath("/").replace('\\', '/');
//out.println("Path "+webRootPath+"<br />");

path = webRootPath+File.separator+"META-INF"+File.separator;

String sessionFilename = path+"session_"+cdsid+"_"+sessionid+".json";
String defaultFilename = path+"session_"+cdsid+"_default.json";
String masterFilename = path+"session_demoapp_default.json";

//out.println("fn: "+masterFilename+"<br />");

File sessionFile = new File(sessionFilename);
File defaultFile = new File(defaultFilename);
File masterFile = new File(masterFilename);

//
// Check for a new User/File ...
//
if ( !masterFile.exists() ) {
   try {
     PrintWriter sout = new PrintWriter(masterFilename);
     sout.println( json_default );
     sout.close();
   } catch (Exception e) {
      e.printStackTrace();
   }
}
//
// Check for a new User/File ...
//
if ( !sessionFile.exists() ) {
   if ( !defaultFile.exists() ) {
      try {
         FileInputStream fileInputStream = new FileInputStream(masterFilename);
         FileOutputStream fileOutputStream = new FileOutputStream(defaultFilename);
         FileOutputStream fileOutputStream1 = new FileOutputStream(sessionFilename);
         int bufferSize;
         byte[] bufffer = new byte[512];
         while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
            fileOutputStream.write(bufffer, 0, bufferSize);
            fileOutputStream1.write(bufffer, 0, bufferSize);

         }
         fileInputStream.close();
         fileOutputStream.close();
         fileOutputStream1.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
   } else { 
      try {
         FileInputStream fileInputStream = new FileInputStream(defaultFile);
         FileOutputStream fileOutputStream = new FileOutputStream(sessionFile);
         int bufferSize;
         byte[] bufffer = new byte[512];
         while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
            fileOutputStream.write(bufffer, 0, bufferSize);
         }
         fileInputStream.close();
         fileOutputStream.close();
      } catch (Exception e) {
         e.printStackTrace();
      } 
   }   
}


//
// Read Session File JSON Data Parameters ...
//
try {

   JSONParser parser = new JSONParser();

   Object obj = parser.parse(new FileReader(sessionFilename));

   JSONObject jsonObject = (JSONObject) obj;

   /*
   for(Iterator iterator = jsonObject.keySet().iterator(); iterator.hasNext();) {
      String key = (String) iterator.next();
      out.println(key + "---" + jsonObject.get(key));
      out.println("<br />");
   }
   */

   // 
   // Get Session Name ...
   //
   String session_name = (String) jsonObject.get("session_name");
   //out.println("session_name: "+session_name+"<br />");
	  
   //
   // Process Pages ... 
   //
   JSONObject pobj = (JSONObject) jsonObject.get("pages");
   for(Iterator iterator = pobj.keySet().iterator(); iterator.hasNext();) {
      String key = (String) iterator.next();
      //out.println(key + " --- " + pobj.get(key) + "<br />");
      //
      // Get Current Page Data ...
      //
      if (key.equals(pageName)) {
         JSONObject pg = (JSONObject) pobj.get(pageName); 
/*********
         for (Iterator iterator3 = pg.keySet().iterator(); iterator3.hasNext();) {
            String key3 = (String) iterator3.next();
            out.println(key3 + " --- " + pg.get(key3) + "<br />");
         }
*********/
	 long lcnt = (Long) pg.get("icnt");
         icnt = (int)lcnt;
         long lpage = (Long) pg.get("ipage");
         ipage = (int)lpage;
         long ltotal = (Long) pg.get("itotal");
         itotal = (int)ltotal;
         isearch = (String) pg.get("isearch");
         sortname = (String) pg.get("sortname");
         sortdirection = (String) pg.get("sortdirection");

         JSONObject fobj = (JSONObject) pg.get("ifilter");
         for (Iterator iterator2 = fobj.keySet().iterator(); iterator2.hasNext();) {
            String key2 = (String) iterator2.next();
            //out.println(key2 + " --- " + fobj.get(key2));
            ifilter = ifilter+key2+":"+fobj.get(key2)+"::";
            //out.println("<br />");
         }

      }      // if key ...
   }         // for pobj iterator ...

   /*
   out.println("icnt = "+String.valueOf(icnt)+" | ");
   out.println("ipage = "+String.valueOf(ipage)+" | ");
   out.println("itotal = "+String.valueOf(itotal)+" | ");
   out.println("isearch = "+isearch+" | ");
   out.println("sortname = "+sortname+" | ");
   out.println("sortdirection = "+sortdirection+" | ");
   out.println("ifilter = "+ifilter+"<br />");
   out.println("<hr />");
   */

} catch (Exception e) {
   out.println(e);
}   

%>
