 
   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   import java.lang.*;
import java.text.DecimalFormat;
 
public class registration extends HttpServlet {

Connection con=null;
    Statement st=null,st1=null;
    ResultSet rs=null;
    RequestDispatcher rd=null;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
 
            
            HttpSession sn = req.getSession(true);
     
	   String fullname= req.getParameter("fullname");
            String username= req.getParameter("username");
          String password= req.getParameter("password");
           
        	String prof= req.getParameter("prof");
        	
		String mobile1= req.getParameter("mobile");
		String emailid1= req.getParameter("emailid");
                
               
        	RequestDispatcher rd;

	try {
		
		
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot","root","password");
             st1 = con.createStatement();
            int add=st1.executeUpdate("insert into register values('"+fullname+"','"+username+"','"+password+"','"+prof+"','"+mobile1+"','"+emailid1+"')");
            rd=req.getRequestDispatcher("success.jsp");
            rd.forward(req,res);
        } catch(Exception e2) {
             rd=req.getRequestDispatcher("failure.jsp");
        }
    }
}