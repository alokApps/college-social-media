<%-- 
    Document   : profile
    Created on : Jun 22, 2014, 10:28:24 PM
    Author     : alok
--%>

<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            Class.forName("oracle.jdbc.driver.OracleDriver");
          Connection cn=(Connection)DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","alok","alok");
          String f=(String)AuthenticateServlet.u;
        PreparedStatement ps=cn.prepareStatement("select * from stud1 where id=?");
        ps.setString(1, f);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
        out.println("id :"+rs.getString(1)+"\n");
        out.println("name:"+rs.getString(3));
        }
        
        
        
        
        %>
    </body>
</html>
