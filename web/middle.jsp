<%-- 
    Document   : middle
    Created on : 24-Jun-2014, 20:33:43
    Author     : ABHISHEK
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
String r = request.getParameter("email");
session.setAttribute("azx", r);
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
PreparedStatement ps=con.prepareStatement("select * from student where email_id=?");
ps.setString(1,r);
ResultSet rs=ps.executeQuery();
if(rs.next()){
String nm =rs.getString(1);
String pass =rs.getString(4);
String cm ="your userid is"+" "+ nm+" "+"and password is"+" "+pass;
session.setAttribute("u",cm);
//session.setAttribute("v",name);
}
ps.close();
con.close();

}catch(Exception e){e.printStackTrace();}
%>

<jsp:forward page="EmailSendingServlet">
   <jsp:param name="" value=""/>
   </jsp:forward>
           