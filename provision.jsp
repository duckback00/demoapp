<%
//session.setAttribute("dbSource","");
//   String vname=request.getParameter("vname");
//String tmp = session.getAttribute("vdbName");

//
// Set Session Variables ...
//

String tmp = request.getParameter("submit");
if (request.getParameter("submit") != null) {
  session.setAttribute("vname",request.getParameter("vname"));
  session.setAttribute("mntPath",request.getParameter("mntPath"));
  session.setAttribute("dpxGrp",request.getParameter("dpxGrp"));
  session.setAttribute("envNm",request.getParameter("envNm"));
  session.setAttribute("envInst",request.getParameter("envInst"));
%>
<script>
   window.close();
</script>
<%
} 

%>
<html>
<head>
<title>Delphix Provision VDB</title>
<script type="text/javascript">
function CloseMySelf(sender) {
    //alert (document.form0.elements["vname"].value);
    //alert (sender.elements["vname"].value);
    try {
        //window.opener.HandlePopupResult(sender.getAttribute("result"));
        window.opener.HandlePopupResult(sender.elements["vname"].value,sender.elements["mntPath"].value,sender.elements["dpxGrp"].value,sender.elements["envNm"].value,sender.elements["envInst"].value);
    }
    catch (err) {}
    ////window.close();
    ////return false;
}
window.focus();
</script>
</head>
<body>
<center>

<table border=0 width=600>
<tr><td rowspan=2><img height=50 src="./img/logo_delphix_small.gif"></td><td>&nbsp;</td></tr>
<tr><td width="55%" valign="bottom"><font size=+1><b>Provisioning VDBs</b></font></td></tr>
</table>

<br />
<form name=form0 method="POST" action="provision.jsp">
<table style="background-color:silver;" border=1 width=600>

<tr>
<td align=right>New VDB Name: </td><td><input type="text" name="vname" value="<%= session.getAttribute("vname") %>" size=54 /></td>
</tr>

<tr>
<td align=right>Mount Path <font size=-1 color=blue>(Oracle Only)</font>: </td><td><input type="text" name="mntPath" value="<%= session.getAttribute("mntPath") %>" size=54 /></td>
</tr>

<tr>
<td align=right>Delphix Group Name: </td><td><input type="text" name="dpxGrp" value="<%= session.getAttribute("dpxGrp") %>" size=54 /></td>
</tr>

<tr>
<td align=right>Target Environment Name: </td><td><input type="text" name="envNm" value="<%= session.getAttribute("envNm") %>" size=54 /></td>
</tr>

<tr>
<td align=right width="40%">Target Environment Instance: </td><td><input "type=text" name="envInst" value="<%= session.getAttribute("envInst") %>" size=54 /></td>
</tr>

<tr>
<td colspan=2 align=center>
<input type="submit" name="submit" value="submit" onclick="CloseMySelf(document.form0); return true" />
<!--- input type=submit value="submit" onclick="return CloseMySelf(document.form0);" / --->
</td>
</tr>

</table>
</form>

<table style="font-size:9pt;background-color:snow;" border=1 cellspacing=0 cellpadding=2 width=600>
<tr><th>Form Parameter</th><th>Sample Oracle Responses</th><th>Sample SQL Server Responses</th></tr>
<tr><td align=right>New VDB Name: </td><td>VORC</td><td>VMSSQL</td></tr>
<tr><td align=right>Mount Path <span style="font-size:8pt;color:blue;">(Oracle Only)</span>: </td><td>/mnt/provision</td><td>&nbsp;</td></tr>
<tr><td align=right>Delphix Group Name: </td><td>Oracle_Target</td><td>Windows_Target</td></tr>
<tr><td align=right>Target Environment Name: </td><td>Oracle Target</td><td>Window Target</td></tr>
<tr> <td align=right>Target Environment Instance: </td><td>/u02/ora/app/product/11.2.0/dbhome_1</td><td>MSSQLSERVER</td></tr>
</table>

<!--- a href="#" result="allow" onclick="return CloseMySelf(this);">Allow</a --->
<!--- a href="#" result="disallow" onclick="return CloseMySelf(this);">Don't Allow</a --->

</body>
</html>
