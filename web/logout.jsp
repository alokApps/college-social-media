<%-- 
    Document   : logout
    Created on : Jun 21, 2014, 10:55:13 PM
    Author     : alok
--%>

<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("uname", null);
session.invalidate();
response.sendRedirect("index1.html");
//AuthenticateServlet.cn.close();
%>