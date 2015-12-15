package cbuzz.co.pack1;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
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
import javax.servlet.http.HttpSession;

public class AuthenticateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    HttpServletRequest request;

    /**
     *
     */
    public static String u;
    public static String k;
    public static Connection cn;
    public static PreparedStatement ps;
   // public static PreparedStatement ps1;
    RequestDispatcher rd;
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
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
        
         u=request.getParameter("uname");
       
        String p=request.getParameter("passwd");
        try{
             ps=cn.prepareStatement("select * from student where s_id=? and pass=?");
            // ps1=cn.prepareStatement("select s_id from student where name=?");
          //   ps1.setString(1, u);
             // ResultSet rs1=ps1.executeQuery();
            //  k=rs1.getString(1);
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs=ps.executeQuery();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            if(rs.next())
            {
                
               
                 rd=request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
                
            }
            else
            {
                rd=request.getRequestDispatcher("index.html");
                rd.include(request, response);
                out.println("<font color=blue size=10>");
                out.println("invalid username/password");
                out.println("</font>");
                
            }
            
            
        } catch (SQLException ex) {
            
            Logger.getLogger(AuthenticateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       }
       
   
       }





           