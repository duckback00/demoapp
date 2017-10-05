<%


         if (!name.equals("CNT") && !name.equals("RNUM")) {

            out.println("<th align=\"center\" style=\"\">");

            String tmpname = name;
            String tmpasc = "images/sort_asc_disabled.png";
            String tmpdesc = "images/sort_desc_disabled.png";
            if (sortname.equals(name)) {
               tmpname = "<font color=red>"+name.replace("_"," ")+"</font>";
               if (sortdirection.equals("ASC")) {
                 tmpasc = "images/sort_asc.png";
               } else {
                 tmpdesc = "images/sort_desc.png";
               }
            }
//            String sasc = "<a href=\"?sortdirection=ASC&sortname="+name+"\"><image src=\""+tmpasc+"\" border=\"\" alt=\"&nbsp;\" /></a>";
//            String sdesc = "<a href=\"?sortdirection=DESC&sortname="+name+"\"><image src=\""+tmpdesc+"\" border=\"\" alt=\"&nbsp;\" /></a>";

            String sasc = "<image src=\""+tmpasc+"\" border=\"\" alt=\"&nbsp;\" onclick=\"document.forma_"+name+".submit();\" />";
            String sdesc = "<image src=\""+tmpdesc+"\" border=\"\" alt=\"&nbsp;\" onclick=\"document.formd_"+name+".submit();\" />";

            out.println("<table border=0 id=\"\" style=\"border-collapse:collapse;font-size:9pt;height:16px;\">");
out.println("<form name=\"forma_"+name+"\" method=\"POST\">");
out.println("<input type=\"hidden\" name=\"sortdirection\" value=\"ASC\" />");
out.println("<input type=\"hidden\" name=\"sortname\" value=\""+name+"\" />");
            out.println("<tr>");
            out.println("<th rowspan=2>"+tmpname.replace("_"," ")+"</th>");
            out.println("<td valign=top align=center style=\"height:8px;line-height:8px;\">"+sasc+"</td>");
            out.println("</tr>");
out.println("</form>");
out.println("<form name=\"formd_"+name+"\" method=\"POST\">");
out.println("<input type=\"hidden\" name=\"sortdirection\" value=\"DESC\" />");
out.println("<input type=\"hidden\" name=\"sortname\" value=\""+name+"\" />");
            out.println("<tr>");
            out.println("<td valign=top align=center style=\"height:8px;line-height:8px;\">"+sdesc+"</td>");
            out.println("</tr>");
out.println("</form>");
            out.println("</table>");

            out.println("</th>");
         }
%>
