 <%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
  <%
try{ 
    
Class.forName("oracle.jdbc.driver.OracleDriver");
out.println("Connection loaded");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","alok","alok");
out.println("Connection created");

String ll=request.getParameter("user_file");
String lo=request.getParameter("hint");
File imgfile = new File(ll);
	
FileInputStream fin = new FileInputStream(imgfile);
	 
PreparedStatement pre = con.prepareStatement("insert into stud1 (id,img) values(?,?)");
pre.setString(1,lo);
pre.setBinaryStream(2,fin,(int)imgfile.length());
pre.executeUpdate();
pre.close();
}catch(Exception E){ out.println("the eror is  "+ E);}
%>