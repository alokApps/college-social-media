/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cbuzz.co.pack1;

import static cbuzz.co.pack1.ChatIdAuthenticate.cn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alok
 */
public class PostServlet extends HttpServlet {
    
    PrintWriter out;
    RequestDispatcher rd;
    
      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String st=request.getParameter("usrPost");
            String st1=(String)AuthenticateServlet.u;
        PreparedStatement ps=AuthenticateServlet.cn.prepareStatement("insert into userPost(id,post) values(?,?)");
        ps.setString(1, st);
        ps.setString(2, st1);
        ResultSet rs=ps.executeQuery();
        out=response.getWriter();
        if(rs.next())
        {
             rd=request.getRequestDispatcher("home.jsp");
                rd.include(request, response);
           
        }
        else
        {
            rd=request.getRequestDispatcher("home.jsp");
                rd.include(request, response);
            
        }
        
        }
        catch(Exception e)
        {
            out.println("problem ache");
            e.printStackTrace();
        }
    }
}