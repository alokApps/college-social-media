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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>your messages :</h1> 
        
        <% 
        try{
            
            
            String s=AuthenticateServlet.u;
        PreparedStatement pd=AuthenticateServlet.cn.prepareStatement("select * from message where receiver_id=?");
        pd.setString(1, s);
        ResultSet rd=pd.executeQuery();
        int i=1;
       if(rd.next()){
        while(rd.next())
        {
            
            out.println("<h2><table><tr>");
            out.println("<td style=color:red;>"+i+"</td><td style=color:cyan;>from:   "+rd.getString(2)+"</td>");
            out.println("<td>:"+rd.getString(3)+"</td></tr></table></h2>");
            
            i++;
        }
        }
        else
        {
                out.println("<h1>no messages<h1>");
                }}
        catch(Exception e)
        {
            e.printStackTrace();
        
        }
            %>
        
    </body>
</html>
