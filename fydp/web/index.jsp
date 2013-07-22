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
        <style type="text/css">
            #myoutercontainer { position: fixed;
                top: 50%;
                left: 50%;
                margin-top: -50px;
                margin-left: -100px;}
            
        </style>
    </head>
    <body>
        <div id="myoutercontainer">
            
                <form name="start" ACTION="QueryServlet?qnum=1" METHOD="post">
                    Start Date:<input id="datepicker" name ="startDate" />
                    <br>End Date:<input id="datepicker2" name ="endDate" />
                    <br><td><INPUT name="SUBMIT" TYPE=SUBMIT></td>
                </form>
            
        </div>
    
    </body>
    
</html>
