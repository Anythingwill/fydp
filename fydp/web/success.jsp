<%-- 
    Document   : success
    Created on : Jul 11, 2013, 11:36:52 AM
    Author     : Ethan
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%! ArrayList<String> voltages;%>
    <% voltages = (ArrayList<String>) request.getAttribute("test");%>
    <body>
        <h1>Hello World!</h1>
        <%
            if (voltages != null) {
                out.println("<h1>Sensor Data</h1>");
                out.println("<table border=1>");
                out.println("<tr><th>voltages</th></tr>");
                for (String volt : voltages) {
                    out.println("<tr><td>");
                    out.print(volt);
                    out.print("</td><td>");
                    
                }
                out.println("</table>");
            }
        %>
    </body>
</html>
