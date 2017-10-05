<%-- 
    Document   : self-service demo app
    Created on : Aug 13, 2013, 12:25:02 PM
    Author     : vtigadi
    Updated    : Sep 15, 2016 Bitt...
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//
// Defaults ...
//
/****
String newVDB = "VBITT";
String mountPath = "/mnt/provision";
String delphixGroup = "Oracle_Target";
String envName = "Oracle Target";
String envInstance = "/u02/ora/app/product/11.2.0/dbhome_1";
****/
String newVDB = "mssql1";
String mountPath = "";
String delphixGroup = "Windows_Target";
String envName = "Window Target";
String envInstance = "MSSQLSERVER";

// 
// No changes required below here ...
//
if (session.getAttribute("vname") == null) { session.setAttribute("vname",newVDB); }
if (session.getAttribute("mntPath") == null) {  session.setAttribute("mntPath",mountPath); }
if (session.getAttribute("dpxGrp") == null) { session.setAttribute("dpxGrp",delphixGroup); }
if (session.getAttribute("envNm") == null) { session.setAttribute("envNm",envName); }
if (session.getAttribute("envInst") == null) { session.setAttribute("envInst",envInstance); }

newVDB = (String)session.getAttribute("vname"); 
mountPath = (String)session.getAttribute("mntPath"); 
delphixGroup = (String)session.getAttribute("dpxGrp");
envName = (String)session.getAttribute("envNm"); 
envInstance = (String)session.getAttribute("envInst");

%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv='cache-control' content='no-cache'>
        <meta http-equiv='expires' content='0'>
        <meta http-equiv='pragma' content='no-cache'>
        <title>Database Self-service Demo</title>
        <!-- Bootstrap core CSS -->
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 10px;
                padding-bottom: 10px;
            }
            .label,.badge {
                font-size: 15px;
            }
            .table th,
            .table td {
                text-align: center;
                padding:6px;
            }
            .hero-unit {
                padding-left: 14px;
                padding-right: 7px;
                padding-top: 14px;
                padding-bottom: 14px;
                margin-bottom: 10px;
                font-size: 14px;
                font-weight: 400;
                line-height: 22px;
                color:   #111;
                background-color: #eeeeee;
                -webkit-border-radius: 6px;
                -moz-border-radius: 6px;
                border-radius: 6px;
            }

            #wel{
                padding-top: 12px;
                padding-right: 0px;
            }

            #menubar{
                padding-top: 8px
            }

            #progressBar {
                margin-left: 2px;
                margin-right: 0px;
                margin-top: 4px;
                width : 92%;
                /* height: 20px; */
                border: 1px solid #111;
            }
            
            #progressBarDiv {
                text-align: center;
                /* height: 22px; */
                padding-top: 0px;
            }
            #logo {
                padding-top: 5px;
                padding-right: 0px;
                margin-right: 0px;
            }
            #heading {
                padding-left:0px;
                margin-left: 15px;
                color: #006dcc;
            }
            .btn-link {
                color: #006dcc;
                font-size: 10pt;
                padding-left: 0px;
            }
            #logout {
                color: #0044cc;
                background-color:  #d9d9d9;
            }
        </style>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>  
        <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>  
        <script src="./bootstrap/js/bootbox.min.js"></script>
        <script src="./bootstrap/js/bootstrap-progressbar.min.js"></script>
    </head>
    <body>
      <script>
	var newVDB = "<%=newVDB%>";
	var mountPath = "<%=mountPath%>";
	var delphixGroup = "<%=delphixGroup%>";
	var envName = "<%=envName%>";
	var envInstance = "<%=envInstance%>";

        function initialise() {
           $.post("/DLPXEngineServlet",
           {
              funcName: "loadDLPXEngines"
           },
           function(data, status) {
              $("#dlpxeng").html(data).show();
           });
           $("#vdb").hide();
           $("#vdbhead").hide();
        }
  
	function HandlePopupResult(vname,mntPath,dpxGrp,envNm,envInst) {
	    //alert("result of popup is: " + result);
	    newVDB=vname;
	    mountPath=mntPath;
	    delphixGroup=dpxGrp;
	    envName=envNm;
	    envInstance=envInst;
	    //alert ("Handler: " + newVDB);
	}

        function f_open() {
           var win = window.open('provision.jsp', 'authWindow','toolbar=yes,scrollbars=yes,resizable=yes,top=100,left=200,width=640,height=460')
        } 

        var hostname;
        var refreshNo = 0;
        var syncNo = 0;
        var resetNo = 0;
        var deleteNo = 0;
        var provisionNo = 0;

        $(document).ready(function() {
           $.post("/DLPXEngineServlet",
           {
              funcName: "loadDLPXEngines"
           },
           function(data, status) {
              $("#dlpxeng").html(data).show();
           });
           $("#vdb").hide();
           $("#vdbhead").hide();
        });

        $(document).on("click", ".btn-link", function(event) {
           if (refreshNo != 0 || syncNo != 0 || resetNo != 0 || deleteNo != 0 || provisionNo !=0 ) {
              bootbox.alert("VDB Operations in Progress...Try later!");
              return false;
           }
           hostname = $(this).text();
           $("#vdb").hide();
           $("#vdbhead").hide();
           $.post("/DLPXEngineServlet",
           {
              funcName: "loadVDBObjects",
              engname: hostname
           },
           function(data, status) {
              $("#vdb").html(data).fadeIn('slow');
           });
           $("#vdbhead").html("dSources and VDBs on Delphix Engine: "
              + "<span class=\"label label-info\">"
              + $(this).text()).show("slow")
              + "</span>";
           });

           $(document).on("click", "#vdb td", function(event) {
              var action = $(this);
              var row = $(this).parent();
              var vdb = row.find('td:first');
              var status = row.find('td:eq(2)');
              var percent = 0;
              var json = "";

              if (status.text() == "UNKNOWN") {
                 bootbox.alert("VDB is not ACTIVE, try logging out and logging back in.");
                 return false;
              }
              //else if (status.text() != "RUNNING" && status.text() != null) {
              //    bootbox.alert("Sorry! No actions allowed");
              //    return false;
              //}
  
              if (action.text() == "Refresh") {
                 bootbox.confirm("Refresh VDB: " + vdb.text() + "?", function(result) {
                    if (result) {
                       refreshNo += 1;
                       $.post("/DLPXEngineServlet",
                       {
                          funcName: "refreshVDB",
                          engname: hostname,
                          vdbname: vdb.text()
                       },
                       function(data, status) {});
                       status.html("<em><strong>Refreshing</strong></em>").fadeIn('5000');
                       
                       action.html("<div id =\"progressBar\" class=\"progress\">" +
                                         "<div class=\"bar bar-success\"" +
                                         "role=\"progressbar\"" +
                                         "aria-valuetransitiongoal=\"0\"></div></div>");
                       $('.bar').progressbar({display_text: 'fill'});
                          
                       var interval = setInterval(function() {
                          $.post("/DLPXEngineServlet",
                           {
                             funcName: "getJobCompletionPercent",
                             engname: hostname
                           },
                            function(data, status) {
                                $('.bar').attr('aria-valuetransitiongoal', data).progressbar({display_text: 'fill'});
                                percent = data;
                           }
                          );
                          if (percent == 100) {
                             clearInterval(interval);
                             status.html("RUNNING");
                             refreshNo -= 1;
                             action.html("<button class=\"btn btn-primary\">Refresh</button>");
                          }
                       }, 5000);  
                    }
                 });          
              }
                        
                        
              if (action.text() == "Snap") {
                 bootbox.confirm("Sync VDB: " + vdb.text() + "?", function(result) {
                     if (result) {
                       syncNo += 1;
                       $.post("/DLPXEngineServlet",
                          {
                            funcName: "syncVDB",
                            engname: hostname,
                            vdbname: vdb.text()
                          }, function(data, status) {        
                          });
                          status.html("<em><strong>Snapping</strong></em>").fadeIn('slow');
                          action.html("<div id =\"progressBar\" class=\"progress\">" +
                                         "<div class=\"bar bar-success\"" +
                                         "role=\"progressbar\"" +
                                         "aria-valuetransitiongoal=\"0\"></div></div>");
                          $('.bar').progressbar({display_text: 'fill'});
                      
                         var interval = setInterval(function() {
                            $.post("/DLPXEngineServlet",
                            {
                              funcName: "getJobCompletionPercent",
                              engname: hostname
                            },
                            function(data, status) {
                                $('.bar').attr('aria-valuetransitiongoal', data).progressbar({display_text: 'fill'});
                                percent = data;
                            });
                            if (percent == 100) {
                               clearInterval(interval);
                               status.html("RUNNING").fadeIn('5000');
                               syncNo -= 1;
                               action.html("<button class=\"btn btn-primary\">Snap</button>");
                            }
                         }, 5000);
                      }
                 });          
             }
                        
             if (action.text() == "Reset") {
                 bootbox.confirm("Reset VDB: " + vdb.text() + "?", function(result) {
                    if (result) {
                       resetNo += 1;
                       $.post("/DLPXEngineServlet",
                                {
                                    funcName: "resetVDB",
                                    engname: hostname,
                                    vdbname: vdb.text()
                                },
                           function(data, status) {
                           });
                        status.html("<em><strong>Resetting</strong></em>");
                        
                        action.html("<div id =\"progressBar\" class=\"progress\">" +
                                         "<div class=\"bar bar-success\"" +
                                         "role=\"progressbar\"" +
                                         "aria-valuetransitiongoal=\"0\"></div></div>");
                        $('.bar').progressbar({display_text: 'fill'});
                          
                        var interval = setInterval(function() {
                        $.post("/DLPXEngineServlet",
                               {
                                        funcName: "getJobCompletionPercent",
                                        engname: hostname
                               },
                        function(data, status) {
                                $('.bar').attr('aria-valuetransitiongoal', data).progressbar({display_text: 'fill'});
                                percent = data;
                        });
                            if (percent == 100) {
                                clearInterval(interval);
                                status.html("RUNNING");
                                resetNo -= 1;
                                action.html("<button class=\"btn btn-primary\">Reset</button>");
                            }
                        }, 5000);
                     }
                });
             }

             if (action.text() == "Delete") {
                bootbox.confirm("Delete VDB: " + vdb.text() + "?", function(result) {
                   if (result) {
                      deleteNo += 1;
                      status.html("<em><strong><font color=red>...Waiting...</font></strong></em>");
                      var jqxhr = $.post("/DLPXEngineServlet",
                         {
                             funcName: "deleteVDB",
                             engname: hostname,
                             vdbname: vdb.text()
                         },
                             function(data, status) {
                                json=data;
                                obj = JSON && JSON.parse(json) || $.parseJSON(json);
                         })
                      .done(function() {
                         if (obj.status == "OK") {
                            status.html("<em><strong><font color=teal>Deleting</font></strong></em>");

                            action.html("<div id =\"progressBar\" class=\"progress\">" +
                                        "<div class=\"bar bar-success\"" +
                                        "role=\"progressbar\"" +
                                        "aria-valuetransitiongoal=\"0\"></div></div>");
                            $('.bar').progressbar({display_text: 'fill'});

                            var interval = setInterval(function() {
                               $.post("/DLPXEngineServlet",
                               {
                                  funcName: "getJobCompletionPercent",
                                  engname: hostname
                               },
                               function(data, status) {
                                  $('.bar').attr('aria-valuetransitiongoal', data).progressbar({display_text: 'fill'});
                                  percent = data;
                               });
                               if (percent == 100) {
                                  clearInterval(interval);
                                  status.html("RUNNING");
                                  deleteNo -= 1;
                                  action.html("<button class=\"btn btn-primary\">Delete</button>");
                                  $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                                  initialise();
                               }
                            }, 5000);
                         } else {
                           alert("ERROR: "+json);
                           deleteNo -= 1;
                           status.html("UNKNOWN");
                           $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                           initialise();
                         }
                      })
                      .fail(function() {
                         alert("Error: "+json);
                         deleteNo -= 1;
                         status.html("UNKNOWN");
                         $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                         initialise();
                      })
                      .always(function() {
                         //alert("done");
                      });


                  }     // end if results ...
               });      // end bootbox.confirm
            }           // end if action.txt Delete ...

            if (action.text() == "Provision") {
               bootbox.confirm("<table border=0><tr><td align=right>Provision Source: </td><td>" + vdb.text() + "</td></tr><tr><td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>To the following ... ?</i></td></tr><tr><td align=right>VDB Name: </td><td>"+newVDB+"</td></tr><tr><td align=right>Mount Path: </td><td>"+mountPath+"</td></tr><tr><td align=right>Delphix Group: </td><td>"+delphixGroup+"</td></tr><tr><td align=right>Target Env Name: </td><td>"+envName+"</td></tr><tr><td align=right>Target Env Instance: </td><td>"+envInstance+"</td></tr></table>", function(result) {
                  if (result) {
                     provisionNo += 1;
                     status.html("<em><strong><font color=red>...Waiting...</font></strong></em>");
                     var jqxhr = $.post("/DLPXEngineServlet",
                        {
                            funcName: "provisionVDB", engname: hostname, dSourceName: vdb.text(),
                            vdbName: newVDB, mountPath: mountPath, delphixGroup: delphixGroup,
                            envName: envName, envInstance: envInstance
                        },
                        function(data, status) {
                            json=data;   
                            obj = JSON && JSON.parse(json) || $.parseJSON(json);
                        })
                     .done(function() {
                        if (obj.status == "OK") {
                           status.html("<em><strong><font color=teal>Provisioning</font></strong></em>");

                           action.html("<div id =\"progressBar\" class=\"progress\">" +
                                       "<div class=\"bar bar-success\"" +
                                       "role=\"progressbar\"" +
                                       "aria-valuetransitiongoal=\"0\"></div></div>");
                           $('.bar').progressbar({display_text: 'fill'});
                           var interval = setInterval(function() {
                             $.post("/DLPXEngineServlet",
                             {
                                  funcName: "getJobCompletionPercent",
                                  engname: hostname
                             },
                             function(data, status) {
                                $('.bar').attr('aria-valuetransitiongoal', data).progressbar({display_text: 'fill'});
                                percent = data;
                             });
                             if (percent == 100) {
                               clearInterval(interval);
                               status.html("RUNNING");
                               provisionNo -= 1;
                               action.html("<button class=\"btn btn-primary\">Delete</button>");
                               $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                               initialise();
                             }
                           }, 5000);
                         } else {
                           alert("ERROR: "+json);
                           provisionNo -= 1;
                           status.html("UNKNOWN");
                           $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                           initialise();
                        }
                     })
                     .fail(function() {
                        alert("Error: "+json);
                        provisionNo -= 1;
                        status.html("UNKNOWN");
                        $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });
                        initialise();
                     })
                     .always(function() {
                        //alert("done");
                     }); 

                  }	// end if results ...
               });   	// end bootbox.confirm  
            }		// end if action.txt Provision ...



         });

         $(document).on("click", "#logout", function(event) {

                $.post("/DLPXEngineServlet", { funcName: "clear" }, function(data, status) { });            

         });
     

        </script>

        <div class="container">
            <div class="masthead">
                <div class="row">
                    <div class="span2" id="logo">
                        <a href="/" alt="Home"><img src="./img/logo_delphix_small.gif"></a>
                    </div>
                    <div class="span6" id="heading"> 
                        <h3>Database Self Service</h3>
                    </div>
                    <div class="span2" id="wel">
                        <p class="pull-right"><b>Hi ${param.username}!</b></p>
                    </div>
                    <div class="span2" id="menubar">
                        <ul class="nav nav-pills pull-right">
                            <li><a href="redirect.jsp?logout=yes" id="logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <hr>

            <div class="hero-unit">
                <p>This sample application lets users Snap, Refresh and Reset Delphix Virtual DataBases (VDBs) using native Delphix RESTFull APIs. 
                    Selecting the Delphix Engine on the left provides a list of dSoruces and VDBs that can be operated on. For  
                    VDBs, Refresh is to the most recent snapshot of its parent. Reset to the most recent snapshot taken on the VDB.
                    Any dSource or VDB can be used as a source database to provision new VDBs from. Enjoy!
                </p> 
            </div>

            <div align=center style="padding:10px;">
                <button class="btn btn-primary" onclick="f_open()" style="padding:6px;">Set Provision VDB Target Parameters</button>
            </div>

            <!-- Example row of columns -->
            <div class="row" ><!-- 220px -->
                <div class="span3" style="width:236px;">
                    <br>
                    <br>
                    <table border=0 style="font-size:10pt;" class="table table-striped table-hover" id="dlpxeng">    
                    </table>
                </div><!-- 620px -->
                <div class="span8" style="margin;4px;padding-left:0px;">

                    <h4 id="vdbhead">dSources and VDBs on Delphix Engine</h4>
                    <table style="font-size:11pt;width:682px;" class="table table-striped table-hover table-bordered" id="vdb">
                        <tr>
                            <th>VDB Name</th>
                            <th>Type</th>
                            <th>Status</th>
                            <th>Snap</th>
                            <th>Refresh</th>
                            <th>Reset</th>
                            <th>Delete</th>
                            <th>Provision</th>
                        </tr>
                    </table>

                </div>
            </div>
            <hr>

        </div> <!-- /container -->

    </body>
</html>
