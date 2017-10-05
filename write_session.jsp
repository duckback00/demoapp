<%

//out.println("<hr />sessionid: "+sessionid+" cdsid: "+cdsid+" pageName:"+pageName+"<br />");


//
// Session File Information ...
//
// -- see read_session.jsp for paths and filenames ...

//out.println("filename: "+sessionFilename+"<br />");
//
// Read Session File JSON Data Parameters ...
//
try {

   JSONParser parser = new JSONParser();

   Object obj = parser.parse(new FileReader(sessionFilename));

   JSONObject jsonObject = (JSONObject) obj;

   String session_name = (String) jsonObject.get("session_name");
   //out.println("session_name: "+session_name+"<br />");
   //if (!session_name.equals(sessionid)) {
   //   out.println("session missmatch ...<br />");
   //}
   
   //  
   // Pages ...
   // 
   JSONObject pobj = (JSONObject) jsonObject.get("pages");

   // 
   // Check for any diffs ...
   //
   if (  1 != 0 ) {

      //out.println("Updating Session File ...<br />");

      JSONObject filterObj = new JSONObject();
      filterObj.put("","");
 
      JSONObject newObj = new JSONObject();
      newObj.put("icnt", icnt);
      newObj.put("ipage", ipage);
      newObj.put("itotal", itotal);
      newObj.put("isearch", isearch);
      newObj.put("sortname", sortname);
      newObj.put("sortdirection", sortdirection);
      newObj.put("ifilter", filterObj);

      JSONObject wobj = new JSONObject();
      wobj.put("session_name", sessionid);
      wobj.put("cdsid", cdsid);

      JSONObject pages_obj = new JSONObject();
//out.println("ln "+marr.length+"<br />");
      for (int i = 0; i < marr.length; i++) {
         String mtmp = marr[i].toLowerCase().replace(" ","").replace("-","") + ".jsp";
//out.println(mtmp+" "+pageName+"<br />");
         if (mtmp.equals(pageName)) {
            //out.println(mtmp+"<br />");
            pages_obj.put(pageName, (JSONObject) newObj );
         } else {
            if ( (JSONObject)pobj.get(mtmp) != null ) {
               pages_obj.put(mtmp, (JSONObject) pobj.get(mtmp));
            } else {
               pages_obj.put(mtmp, (JSONObject) pobj.get(mtmp));
            }
         }
      }   // end for

      wobj.put("pages", pages_obj);

      FileWriter file = new FileWriter(sessionFilename);
      file.write(wobj.toJSONString());
      file.flush();
      file.close();

      //out.print(wobj); 

   }
   
} catch (Exception e) {
   out.println(e);
}   

%>
