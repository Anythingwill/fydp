<%-- 
    Document   : success
    Created on : Jul 11, 2013, 11:36:52 AM
    Author     : Ethan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="fydp.Sensor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date;"%> 
<%@page import="java.util.Calendar;"%> 
<%@page import="java.text.DecimalFormat;"%> 
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            #myoutercontainer { position: fixed;
                top: 50%;
                left: 50%;
                margin-top: -175px;
                margin-left: -100px;}
            #memo {
                
                transform:rotate(270deg);
                -o-transform:rotate(270deg);
                -moz-transform:rotate(270deg);
                -webkit-transform:rotate(270deg);
                position:absolute;
                top:110px;
                left:-80px;
                
            }
            #memo1 {
                width:5em; word-wrap:break-word; margin:2em;
                
                
            }
            
        </style>
    </head>
    <%! ArrayList<Sensor> queriedData;%>
    <% queriedData = (ArrayList<Sensor>) request.getAttribute("test");%>
    <% double total = 0.00;%>
    <%double[] tempFlow = new double[queriedData.size()];%>
    <%double[] tempTotal = new double[queriedData.size()];%>
    <%String[] sensorDate = new String[queriedData.size()];%>
    <%int hic = 4;%>
    <body onload="p.onload()">
        <div id="myoutercontainer">
            <font size="4">
        <%
            if (queriedData != null) {
             
              Date oldD = new Date();
              Date curD = new Date();
              double oldFlow = 0;
            /*  out.println("<h1>Sensor Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>Flow</th><th>time</th><th>total</th></tr>");*/
//                int tessl = queriedData.get(0).GetFlow();
                int i;
                i = 0;
                
              for (Sensor data : queriedData) {
                  
                  Calendar cal = Calendar.getInstance();
                  cal.setTime(data.Getftime());
                  tempFlow[i] = data.GetFlow() *1000;
                  String dayMonth = Integer.toString(cal.get(Calendar.HOUR_OF_DAY)) +":"+ Integer.toString(cal.get(Calendar.MINUTE));
                  sensorDate[i] = dayMonth;
                  
                  //ArrayList<int> tempFlow;
                  //tempFlow = data.GetFlow();
                  
                  long test;
                  curD = data.Getftime(); 
                  test = curD.getTime() - oldD.getTime();
                  oldD = curD;
                 // test = (test/(1000*60*60)); doing L/min
                  //out.println(test);
                  
                  double two = test/(1000.00 * 60.00);
                  
                  double used = oldFlow * two;
                  tempTotal[i] = used*1000;
                  
                  total += used;
                  oldFlow = data.GetFlow();
                  //out.println(data.Getftime());
                  if (i == 0){
                      
                      total = 0;
                  }
                 /* out.println("<tr><td>");
                    out.print(data.GetFlow());
                    out.print("</td><td>");
                    out.print(data.Getftime());
                    out.print("</td><td>");
                    out.print(tempTotal[i]);
                    out.print("</td>");*/
                    i++;
              }
              //Double temp = (new DecimalFormat("#.##").format(total));
              out.println((new DecimalFormat("#.##").format(total)) + " Litres total used");
              //out.println(request.getParameter("startDate"));
            }
        %>
        
        </font>
        
        
        <!-- graph code begins here-->
        <script type="text/javascript" src="wz_jsgraphics.js"></script>
        <script type="text/javascript" src="line.js">

        <!-- Line Graph script-By Balamurugan S http://www.sbmkpm.com/ //-->
        <!-- Script featured/ available at Dynamic Drive code: http://www.dynamicdrive.com //-->
        </script>
        <div id="memo">Flow Rate (mL/min)</div> <!--Y axis label -->
        <div  id="lineCanvas" style="overflow: auto; position:relative;height:300px;width:400px;">
            
        </div>


        <script type="text/javascript">
            var p = {
                onload: function(){

                   
                    var g = new line_graph();
                    
                    var scriptFlow = new Array();
                    var scriptDate = new Array();
                    var count = 100;
                    
                    <%int k;
                     for (k = 1; k< tempTotal.length; k++) {
                    %> scriptFlow[<%=k%>]= <%=tempFlow[k]%>
                       scriptDate[<%=k%>]= "<%=sensorDate[k]%>"
                    <%}%>
                    
                    var prevDate= 100;
                    for(var i=1; i< scriptFlow.length;i++){
                        if (count > 14){
                            g.add(scriptDate[i], scriptFlow[i]);
                            count = 0;
                        }
                        else{
                            g.add('', scriptFlow[i]);
                        }
                        count++;
                        prevDate = scriptDate[i];
                    }
                    
                    
//                    g.setMax(300);
//                    g.setMin(0);

                    g.render("lineCanvas", "Bathroom Sink");
                    
                }
        };
        
        </script>
        
        <!-- graph code ends here-->
        
        <a href="index.jsp">Return to Index</a>
        </div>
    </body>
</html>
