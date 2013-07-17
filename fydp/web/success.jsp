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
    <body>
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
              for (Sensor data : queriedData) {
                  long test;
                  curD = data.Getftime(); 
                  test = curD.getTime() - oldD.getTime();
                  oldD = curD;
                 // test = (test/(1000*60*60)); doing L/min
                  //out.println(test);
                  double one = data.GetFlow();
                  double two = test/(1000.00 * 60.00);
                  total += one * two;
                  //out.println(data.Getftime());
                  if (total < 0){
                      
                      total = 0;
                  }
              }
              String temp = Double.toString(total);
              out.println(temp);
              //out.println(request.getParameter("startDate"));
            }
        %>
        <li><a href="index.jsp">Index</a></li>
        
    </body>
</html>
