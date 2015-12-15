import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class AuthenticateEmail extends HttpServlet {
     
        Connection cn;
        RequestDispatcher rd;
        public static String u;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
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
        processRequest(request, response);
         u=request.getParameter("email");
           try{
                PreparedStatement ps=cn.prepareStatement("select * from student where email_id=?");
            ps.setString(1, u);
            ResultSet rs=ps.executeQuery();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            if(rs.next())
            {
                rd=request.getRequestDispatcher("EmailSendingServlet");
                rd.include(request, response);
                out.println("<font color=red size=10>");
                out.println("password has been sent succesfully");
                out.println("</font>");
                
            }
            else
            {
                rd=request.getRequestDispatcher("forget.html");
                rd.include(request, response);
                out.println("<font color=red size=10>");
                out.println("invalid email_id");
                out.println("</font>");
                
            }
            
           }
           catch(Exception e)
           {
              
               e.printStackTrace();
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
