<%-- 
    Document   : registration
    Created on : Jun 21, 2014, 8:53:14 PM
    Author     : alok
--%>

<%@page import="java.lang.System.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import ="java.sql.*" %>
<% 
    if ( request.getParameter("studimg") != null )
    {
        String ll=request.getParameter("studimg");
        File imgfile = new File(ll);
       FileInputStream fin = new FileInputStream(imgfile);
	 

    String un = request.getParameter("uname");
    String em = request.getParameter("email");
    String pas = request.getParameter("password");
    String phn= request.getParameter("phn");
    String dob = request.getParameter("dob");
    String mname= request.getParameter("mname");
    String fname = request.getParameter("fname");
    String th10= request.getParameter("10th");
    String th12=request.getParameter("12th");
    String degree = request.getParameter("degree");
    String str = request.getParameter("stream");
    String avg= request.getParameter("avg");
    //out.println(pas);
    try
    {
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
       PreparedStatement ps=con.prepareStatement("insert into student(name,email_id,pass,mob_number,d_o_b,mother_name,father_name,percent_10th,percent_12th,degree_s,branch_s,avg_marks,img) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    //int i = st.executeUpdate("insert into student(s_id, name , email_id, password, mob_number,dob,mother_name,father_name,percent_10th,percent_12th,degree,branch,avg_marks) values ('" + uid + "','" + uname + "','" + email + "','" + password + "','" + phn ,'" + dob + "','" + mname + "','" + fname + "',th10 ,th12,'" + degree + "','" + degree +"','" + stream + "','" + svg + "')");
    //out.println("bsvjishfvbhiusfvbh"+pas);
     ps.setString(1,un);
     ps.setString(2,em);
     ps.setString(3,pas);
     ps.setString(4,phn);
     ps.setString(5,dob);
     ps.setString(6,mname);
     ps.setString(7,fname);
     ps.setString(8,th10);
     ps.setString(9,th12);
     ps.setString(10,degree);
     ps.setString(11,str);
     ps.setString(12,avg);
     //if(ll==null);
     //else{
     ps.setBinaryStream(13, fin, (int)imgfile.length());
     int i=ps.executeUpdate();
       if (i==1) {
        //session.setAttribute("userid", user);
       // response.sendRedirect("index.html");
       //out.print("Registration Successfull!"+"<a href='index.html'>Go to Login</a>");
       ps.close();
       con.close();
    } 
    else {
        out.println("<h1>fill form with correct datatype</h1>");
        response.sendRedirect("studentregister.html");
        
    }
   }
   catch(Exception e)
   {
       out.println("<h1>fill form with correct datatype</h1>"+e);
       //response.sendRedirect("forget.html");
        
       e.printStackTrace();
   }
    }
   
    else
    {
        File ia = new File("d:\\ab.jpg");
        FileInputStream ins = new FileInputStream(ia);
    String un = request.getParameter("uname");
    String em = request.getParameter("email");
    String pas = request.getParameter("password");
    String phn= request.getParameter("phn");
    String dob = request.getParameter("dob");
    String mname= request.getParameter("mname");
    String fname = request.getParameter("fname");
    String th10= request.getParameter("10th");
    String th12=request.getParameter("12th");
    String degree = request.getParameter("degree");
    String str = request.getParameter("stream");
    String avg= request.getParameter("avg");
    //out.println(pas);
    try
    {
        //InputStream ins = new FileInputStream("E:\abhi\my phn\DCIM\Camera\asd.jpg");
        Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
       PreparedStatement ps=con.prepareStatement("insert into student(name,email_id,pass,mob_number,d_o_b,mother_name,father_name,percent_10th,percent_12th,degree_s,branch_s,avg_marks,img) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
    //int i = st.executeUpdate("insert into student(s_id, name , email_id, password, mob_number,dob,mother_name,father_name,percent_10th,percent_12th,degree,branch,avg_marks) values ('" + uid + "','" + uname + "','" + email + "','" + password + "','" + phn ,'" + dob + "','" + mname + "','" + fname + "',th10 ,th12,'" + degree + "','" + degree +"','" + stream + "','" + svg + "')");
       
     ps.setString(1,un);
     ps.setString(2,em);
     ps.setString(3,pas);
     ps.setString(4,phn);
     ps.setString(5,dob);
     ps.setString(6,mname);
     ps.setString(7,fname);
     ps.setString(8,th10);
     ps.setString(9,th12);
     ps.setString(10,degree);
     ps.setString(11,str);
     ps.setString(12,avg);
     ps.setBinaryStream(13, ins,(int)ia.length());
     int i=ps.executeUpdate();
       if (i==1) {
        //session.setAttribute("userid", user);
       // response.sendRedirect("index.html");
       //out.print("Registration Successfull!"+"<a href='index.html'>Go to Login</a>");
       ps.close();
       con.close();
    } 
    else {
        out.println("<h1>fill form with correct datatype</h1>");
        response.sendRedirect("studentregister.html");
        
    }
   }
   catch(Exception e)
   {
       out.println("<h1>fill form with correct datatype</h1>"+e);
       //response.sendRedirect("forget.html");
    
       e.printStackTrace();
   }
    }
   %>
   <%
    String em = request.getParameter("email");
    
    try
    {
       Class.forName("oracle.jdbc.driver.OracleDriver");
       Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
       PreparedStatement ps=con.prepareStatement("select s_id from student where email_id=?");
       ps.setString(1,em);
       ResultSet rsa = ps.executeQuery();
       if(rsa.next()){
        out.print("Registration Successfull!"+"and your user id is  <h3 style=color:red>"+rsa.getString(1)+"</h3><a href='index.html'>Go to Login</a>");
       ps.close();
       con.close();
    } 
    }
       catch(Exception es)
   {
       out.println("<h1>fill form with correct datatype</h1>"+es);
       //response.sendRedirect("forget.html");
    
       es.printStackTrace();
   }
   
 
%>
