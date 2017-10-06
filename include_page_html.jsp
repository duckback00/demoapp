<!-- Paging -->
<form name="form_first" method="POST">
<td align=center style="width:20px;">
   <input type=hidden name="ipage" value="1" />
   <input type=submit value="First" />
</td>
</form>
<form name="form_prev" method="POST">
<td align=center style="width:20px;">
   <input type=hidden name="ipage" value="<%=ipage-1%>" />
   <input type=submit value="Prev" />
</td>
</form>

<form name="form_sel" method="POST">
<td align=center style="width:60px;">
<%
if ( noPages < 100 ) {
%>
  <select name=ipage style="height:26px;line-height:26px;width:60px;position:relative;top:0px;" onchange="document.form_sel.submit();">
<%
for(int i = 1; i <= noPages; i+=1) {
 if (i == ipage) {
%>
  <option value=<%=i%> selected ><%=i%></option>
<%
 } else {
%>
  <option value=<%=i%>><%=i%></option>
<%
 }
}

} else {
%>
  <input type="text" name="ipage" value="<%=ipage%>" size="7" style="height:24px;line-height:24px;width:60px;font-size:9pt;position:relative;top:0px;" onchange="document.form_sel.submit();" />
<%
}
%>
  </select>
</td>
</form>

<form name="form_next" method="POST">
<td align=center style="width:20px;">
   <input type=hidden name="ipage" value="<%=ipage+1%>" />
   <input type=submit value="Next" />
</td>
</form>

<form name="form_last" method="POST">
<td align=center style="width:20px;">
   <input type=hidden name="ipage" value="<%=noPages%>" />
   <input type=submit value="Last" />
</td>
</form>

<!-- Rows Per Page -->
<form name="form_icnt" method="POST">
<td align=center style="font-size:9pt;width:180px;">
Rows/Page: &nbsp;
<select name=icnt style="height:26px;line-height:26px;width:60px;position:relative;top:0px;" onchange="document.form_icnt.submit();">
<%
for (int i = 0; i < rows_per_page_arr.length; i++) {
%>
   <option value="<%=rows_per_page_arr[i]%>"
<%
if (icnt == rows_per_page_arr[i]) {
%>
 selected
<%
}
%>
><%=rows_per_page_arr[i]%></option>
<%
}   // end for
%>
</select>
</td>
</form>


<!-- Search Table -->
<form name="form_find" method="POST">
<td align=center style="font-size:9pt;width:140px;">
Search: 
<input style="size:12px;line-height:12px;height:12px;" type="text" name="find_value" size="8" value="<%=isearch%>" />
<image height="20" src="images/search_128.png" onclick="document.form_find.submit();" />
</td>
</form>

<td align="right" style="padding-right:4px;font-size:11px;color:blue;">Rows <%=istart%> thru <%=iend%> out of <%=itotal%></td>

