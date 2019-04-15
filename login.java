   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   public class login extends HttpServlet {
    String username="";
    String password="";
    String type1="",key2="";
    Connection con=null;
    Statement st=null,st1=null,st2=null;
    ResultSet rs=null,rs1=null,rs2=null;
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
        username = req.getParameter("username");
        password = req.getParameter("password");
       
	
	HttpSession sn = req.getSession(true);
     sn.setAttribute("username",username);
     
     
		RequestDispatcher rd = null;
                
        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot","root","password");
            st = con.createStatement();
            rs = st.executeQuery("select * from register where username='"+username+"' && password='"+password+"'");
           
            if(rs.next()) {
               
             
                
                rd=req.getRequestDispatcher("userpage.jsp");
               		
            } 
            
            else {

               rd=req.getRequestDispatcher("failure.jsp");
	        }
	     rd.forward(req,res);
        }
        catch(Exception e2)
         {
            System.out.println("Exception : "+e2.toString());
        }
    }
}