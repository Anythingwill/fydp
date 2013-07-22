<%-- 
    Document   : success
    Created on : Jul 11, 2013, 11:36:52 AM
    Author     : Ethan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="fydp.Sensor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date;"%> 
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%! ArrayList<Sensor> queriedData;%>
    <% queriedData = (ArrayList<Sensor>) request.getAttribute("test");%>
    <% double total = 0.00;%>
    <%int[] tempFlow = new int[queriedData.size()];%>
    <%Double[] tempTotal = new Double[queriedData.size()];%>
    <%int hic = 4;%>
    <body onload="p.onload()">
        <h1>Hello World!</h1>
        <%
            if (queriedData != null) {
              /*  out.println("<h1>Sensor Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>voltages</th></tr>");
                for (String volt : voltages) {
                    out.println("<tr><td>");
                    out.print(volt);
                    out.print("</td><td>");
                    
                }
                out.println("</table>");
            */
              Date oldD = new Date();
              Date curD = new Date();
              out.println("<h1>Sensor Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>Flow</th><th>time</th><th>total</th></tr>");
//                int tessl = queriedData.get(0).GetFlow();
                int i;
                i = 0;
                
              for (Sensor data : queriedData) {
                  
                  tempFlow[i] = data.GetFlow();
                  
                  //ArrayList<int> tempFlow;
                  //tempFlow = data.GetFlow();
                  
                  long test;
                  curD = data.Getftime(); 
                  test = curD.getTime() - oldD.getTime();
                  oldD = curD;
                 // test = (test/(1000*60*60)); doing L/min
                  //out.println(test);
                  double one = data.GetFlow();
                  double two = test/(1000.00 * 60.00);
                  tempTotal[i] = one * two;
                  
                  total += one * two;
                  //out.println(data.Getftime());
                  if (total < 0){
                      
                      total = 0;
                  }
                  out.println("<tr><td>");
                    out.print(data.GetFlow());
                    out.print("</td><td>");
                    out.print(data.Getftime());
                    out.print("</td><td>");
                    out.print(tempTotal[i]);
                    out.print("</td>");
                    i++;
              }
              String temp = Double.toString(total);
              out.println(temp);
              //out.println(request.getParameter("startDate"));
            }
        %>
        <li><a href="index.jsp">Index</a></li>
        
        <!-- graph code begins here-->
        <script type="text/javascript" src="wz_jsgraphics.js"></script>
        <script type="text/javascript" src="line.js">

        <!-- Line Graph script-By Balamurugan S http://www.sbmkpm.com/ //-->
        <!-- Script featured/ available at Dynamic Drive code: http://www.dynamicdrive.com //-->

        </script>

        <div id="lineCanvas" style="overflow: auto; position:relative;height:300px;width:400px;"></div>

        <script type="text/javascript">
            var p = {
                onload: function(){

                   
                    var g = new line_graph();
                    
                    var scriptFlow = new Array();
                    <%int k;
                     for (k = 1; k< tempTotal.length; k++) {
                    %> scriptFlow[<%=k%>]= <%=tempTotal[k]%>
                    <%}%>
                    
                    for(var i=1; i< <%=tempTotal.length%>;i++){
                        g.add('', scriptFlow[i]);
                    }
                    
                    /*g.add('1', 145);
                    g.add('2', 0);
                    g.add('3', 175);
                    g.add('4', 130);
                    g.add('5', 150);
                    g.add('6', 175);
                    g.add('7', 205);
                    g.add('8', 125);
                    g.add('9', 125);
                    g.add('10', 135);
                    g.add('11', 125);
            */
                    g.render("lineCanvas", "Line Graph");
                }
        };
        </script>
        <!-- graph code ends here-->
        
    </body>
</html>
