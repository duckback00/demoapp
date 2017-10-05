<%
String str = "";
/*
int ipage = 0;
int icnt = 0;
int itotal = 0;
String isearch = "";
String sortname = "";
String sordirection = "";
String ifilter = "";
*/

//
// Get/Set Page Number ...
//
if (request.getParameter("ipage") != null) {
   String page_str = (String)request.getParameter("ipage");
   ipage=Integer.parseInt(page_str);
}
//
// If Prev Page is less than 0 ...
//
if (ipage <= 0) {
   ipage = 1;
}

//
// Get/Set Number of Records Per Page value ...
//
if (request.getParameter("icnt") != null) {
   String icnt_str=(String)request.getParameter("icnt");
   icnt=Integer.parseInt(icnt_str);
}
//
// Number of Pages Calculation ...
//
int noPages = 1;
if (itotal > 0) {
   noPages = (itotal / icnt) + 1;
   if (ipage > noPages) {
      ipage = noPages;
   }
   if ( (itotal * 1.0 / icnt) == (itotal/icnt) ) {
      noPages = noPages - 1;
   }
}
//
// If Next Page is greater than Number of Pages ...
//
if (ipage > noPages) {
   ipage = noPages;
}

//
// Start and End Records to Fetch ...
//
int istart = ((ipage - 1) * icnt) + 1;
int iend = istart + icnt - 1;
if (iend > itotal) {
   iend = itotal;
}

//
// Get/Set Sort Parameters ...
//
String sorder = " order by ";
if (request.getParameter("sortname") != null) {
   sortname = (String)request.getParameter("sortname");
}
if (request.getParameter("sortdirection") != null) {
   sortdirection = (String)request.getParameter("sortdirection");
}
if (sortname == null || sortname.equals("")) {
   sorder = "";
   sortdirection = "";
}

//
// Get/Set Search Parameters ...
//
if (request.getParameter("find_value") != null) {
   isearch = (String)request.getParameter("find_value");
}

%>
