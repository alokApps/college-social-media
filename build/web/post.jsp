<%-- 
    Document   : post
    Created on : Jun 24, 2014, 1:03:29 PM
    Author     : alok
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            </head>
    <body>
        
        <%
         try{    
             
        PreparedStatement pd=AuthenticateServlet.cn.prepareStatement("select * from userPost order by column_id desc");
       
        ResultSet rd=pd.executeQuery();
        int i=1;
       if(rd.next()){
        while(rd.next())
        {
            out.println("<body><table><tr><td style=color:black;>");
            out.print("<h2>id:"+rd.getString(3)+"</h2>");
            out.println("</td><td><h2 style=color:cyan;><br>"+"            "+rd.getString(1)+"</h2></td>");
            out.println("</tr></table><body>");
            i++;
        }
        }
        else
        {
                out.println("<h1>no posts<h1>");
                }}
        catch(Exception e)
        {
            e.printStackTrace();
            out.println("<h1>Exception occurs<h1>");
        
        }
            
            %>
    </body>
</html>
