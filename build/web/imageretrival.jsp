<%-- 
    Document   : image
    Created on : 22-Jun-2014, 14:22:30
    Author     : ABHISHEK
--%>
<%@page import="cbuzz.co.pack1.AuthenticateServlet"%>
<%@page import="java.io.*"%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
//String a=(String)request.getSession().getAttribute("abc");
AuthenticateServlet as;
String f=(String)AuthenticateServlet.u;
//out.println(f);
PreparedStatement st = conn.prepareStatement("select img from student where S_ID=?");
st.setString(1, f);

ResultSet rs = st.executeQuery(); //name is a field in database
if (rs.next())
{
Blob b=rs.getBlob(1);
byte barr[]=b.getBytes(1,(int)b.length());
response.setContentType("image/jpeg");
OutputStream o = response.getOutputStream();
o.write(barr);

o.flush();
o.close();
}
else
{
 PreparedStatement st1 = conn.prepareStatement("select img from faculty where f_id='aec_f102'");
//st.setString(1, f);

ResultSet rs1 = st1.executeQuery(); //name is a field in database
if (rs.next())
{
Blob b=rs.getBlob(1);
byte barr[]=b.getBytes(1,(int)b.length());
response.setContentType("image/jpeg");
OutputStream o = response.getOutputStream();
o.write(barr);

o.flush();
o.close();   
}}

}
catch(Exception e){}
%>
<html>
<img src="imageretrival.jsp" width="100" border="0">
</html>