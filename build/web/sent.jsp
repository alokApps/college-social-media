<%-- 
    Document   : inbox
    Created on : Jun 23, 2014, 10:20:19 PM
    Author     : alok
--%>

<%@page import="cbuzz.co.pack1.ChatIdAuthenticate"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sent message</title>
    </head>
    <body>
        <h1>your sent messages :</h1> 
        
        <% 
        try{
            
            
            String s=AuthenticateServlet.u;
        PreparedStatement pd=AuthenticateServlet.cn.prepareStatement("select * from message where sender_id=?");
        pd.setString(1, s);
        ResultSet rd=pd.executeQuery();
        int i=1;
       if(rd.next()){
        while(rd.next())
        {
            
            out.println("<table><h2><tr><td style=color:red;");
            out.println(i+"</td><td> To:"+rd.getString(1)+"</td>");
            out.println("<td style=color:cyan;>:"+rd.getString(3)+"</td></tr></h2></table>");
            
            i++;
        }
        pd.close();
        rd.close();
        }
        else
        {
                out.println("<h1>no messages<h1>");
                }}
        catch(Exception e)
        {
            e.printStackTrace();
            out.println("<h1>Exception ache<h1>");
        
        }
            %>
        
    </body>
</html>
