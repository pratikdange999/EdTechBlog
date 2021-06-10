<%-- 
    Document   : error_page
    Created on : 09-Jun-2021, 7:02:17 pm
    Author     : Pratik Dange <@PratikDange999>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SORRY ,Something went wrong..!!!</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    </head>
    <body>
        <div class="container text-center">
            <image src="img/error.png" class="image-fluid">
            <h3>SORRY ,Something went wrong..!!!</h3>
            <%= exception %>
            <a href="index.jsp" class="btn primary-background text-white mb-3">HOME</a>
        </div>
    </body>
</html>
