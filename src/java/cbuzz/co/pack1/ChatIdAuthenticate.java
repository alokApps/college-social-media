/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package cbuzz.co.pack1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class ChatIdAuthenticate extends HttpServlet {
 public static String u;
 String l;
    public static Connection cn;
    public static PreparedStatement ps;
    PrintWriter out;
    RequestDispatcher rd;
    PreparedStatement ps1;
    String s;
    @Override
    public void init(ServletConfig config)
    {
        ServletContext ctx=config.getServletContext();
       try{
           Class.forName("oracle.jdbc.driver.OracleDriver");
           cn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","alok");
           
       } 
       catch(ClassNotFoundException e)
       {
       } catch (SQLException e) {
        }
        
    } 
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
         l=request.getParameter("idk");
         s=request.getParameter("text");
       
       //AuthenticateServlet auth1=new AuthenticateServlet();
        try{
             ps=cn.prepareStatement("select * from student where s_id=?");
            ps.setString(1, l);
         
            ResultSet rs=ps.executeQuery();
            response.setContentType("text/html");
             out=response.getWriter();
            if(rs.next())
            {
               ps1=cn.prepareStatement("insert into message(receiver_id,sender_id,msg) values(?,?,?)");
               ps1.setString(1, l);
               ps1.setString(2, AuthenticateServlet.u);
               ps1.setString(3, s);
               ps1.execute();
                
                rd=request.getRequestDispatcher("home.jsp");
               rd.include(request, response);
               out.println("<font color=blue size=10>");
                out.println("message sent");
                out.println("</font>");
            }
            
            
            else
            {
                rd=request.getRequestDispatcher("home.jsp");
                rd.include(request, response);
                out.println("<font color=blue size=10>");
                out.println("invalid id");
                out.println("</font>");
                
            }
            
            
        } catch (SQLException ex) {
            out.println("<font color=blue size=10>");
                out.println("invalid id");
                out.println("</font>");
            
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
