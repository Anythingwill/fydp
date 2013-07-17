<%--Date picker from http://webdesignandsuch.com/add-a-calendar-date-picker-to-a-form-with-jquery/
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 2</title>
        
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

        <script>
        $(document).ready(function() {
          $("#datepicker").datepicker();
        });
        $(document).ready(function() {
          $("#datepicker2").datepicker();
        });
        </script>
    </head>
    <body>
        <h1>Please select one of the following:</h1>
        <ul>
        <li><a href="QueryServlet?qnum=1">Query 1</a></li>
        <li><a href="QueryServlet?qnum=2">Query 2</a></li>
        </ul>
        <form name="start" ACTION="QueryServlet?qnum=1" METHOD="post">
            Start Date:<input id="datepicker" name ="startDate" />
            <br>End Date:<input id="datepicker2" name ="endDate" />
            <td><INPUT name="SUBMIT" TYPE=SUBMIT></td>
        </form>
    </body>
</html>
