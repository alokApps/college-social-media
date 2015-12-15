<%-- 
    Document   : IdSearch
    Created on : Jun 24, 2014, 11:34:04 PM
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
        <title>id search</title>
    </head>
    <body>
        <%
           // String s1=request.getParameter("txt");
           
            String b="a";
            PreparedStatement ps=AuthenticateServlet.cn.prepareStatement("select * from student");
      //  ps.setString(1, b);
        ResultSet rs=ps.executeQuery();
        int i=1;
        if(rs.next()){
            
            //out.println("<img src=imageretrival.jsp height=50px width=150px></img>");
            out.println("<h1> branch  : name  : ID </h1>");
        while(rs.next())
        {
                  
            out.println("<h3>"+i+":"+rs.getString(12)+" :"+rs.getString(2)+":"+rs.getString(1)+"</h3>");
        i++;
        }}
        else{
            out.println("<h1 style=color:red;>no match found</h1>");
            
        }
        %>
    </body>
</html>
