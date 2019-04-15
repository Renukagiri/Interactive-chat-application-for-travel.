
import java.io.File;
import java.sql.DriverManager;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Selva
 */
public class extract {
    public static void main(String args[])
    {
         try {
           
           
            Document htmlFile = null; 
            
                htmlFile = Jsoup.parse(new File("D:\\ChatBot\\web\\url1.jsp"), "ISO-8859-1");
           
        // right 
        String title = htmlFile.title(); 
        Element div = htmlFile.getElementById("login"); 
        String cssClass = div.className(); 
        // getting class form HTML element 
        System.out.println("Jsoup can also parse HTML file directly"); 
        System.out.println("title : " + title); 
        System.out.println("class of div tag : " + cssClass);

            
        }
        catch(Exception e2)
         {
            System.out.println("Exception : "+e2.toString());
        }
    }
    
}
