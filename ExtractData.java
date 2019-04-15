   import java.io.*;
   import java.sql.*;
   import javax.servlet.*;
   import javax.servlet.http.*;
   import java.io.File; 
   import java.io.IOException; 
   import org.jsoup.Jsoup; 
   import org.jsoup.nodes.Document; 
   import org.jsoup.nodes.Element;


   public class ExtractData extends HttpServlet {
    
    Connection con=null;
    Statement st=null,st1=null,st2=null;
    ResultSet rs=null,rs1=null,rs2=null;
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
       
	
	HttpSession sn = req.getSession(true);
        RequestDispatcher rd = null;
                
        try {
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot","root","password");
           
             Statement st3 = con.createStatement();
           // int add3 = st3.executeUpdate("truncate table testcases");
   
            String sql = "TRUNCATE busdetails";
            st3.executeUpdate(sql);
            
            sql = "delete from busdetails";
            st3.executeUpdate(sql);
            
            
            for(int j=1;j<4;j++)
            {
            
          Document htmlFile = null; 
            
         htmlFile = Jsoup.parse(new File("D:\\ChatBot\\web\\url"+j+".jsp"), "ISO-8859-1");
       
        // getting class form HTML element 
     
        String h1 = htmlFile.body().getElementsByTag("td").text();
        
        System.out.println(h1);
        
        String txt[] = h1.split("\\s");
            
            for(int i=3;i<txt.length;i++)
            {
                System.out.println(txt[i]);
                String from = txt[i];
                String to = txt[i+1];
                String travels = txt[i+2];
                String bus = txt[i+3];
                String fare = txt[i+4];
                
                String company="";
                
                if(j==1)
                {
                    company = "paytm";
                }
                if(j==2)
                {
                    company = "redbus";
                }
                if(j==3)
                {
                    company = "abhibus";
                }
                
                 st1 = con.createStatement();
            int add=st1.executeUpdate("insert into busdetails values('"+from+"','"+to+"','"+travels+"','"+fare+"','"+company+"','"+bus+"')");
           
                
               // i=i+4;
            }

            }
        }
        catch(Exception e2)
         {
            System.out.println("Exception : "+e2.toString());
        }
        
         rd=req.getRequestDispatcher("index1.jsp");
          rd.forward(req,res);
    }
}