<%-- 
    Document   : success
    Created on : Jul 11, 2013, 11:36:52 AM
    Author     : Ethan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="fydp.Sensor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%! ArrayList<Sensor> queriedData;%>
    <% queriedData = (ArrayList<Sensor>) request.getAttribute("test");%>
    <% int total = 0;%>
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
              
              for (Sensor data : queriedData) {
                  total += data.GetFlow();
                  out.println(data.Getftime());
              }
              String temp = Integer.toString(total);
              out.println(temp);  
            }
        %>
    </body>
</html>
