<%-- 
    Document   : userLogin
    Created on : Jun 21, 2014, 8:32:32 PM
    Author     : alok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Welcome   <%= session.getAttribute("uname")%>
<a href='logout.jsp'>Log out</a>

    </body>
</html>
