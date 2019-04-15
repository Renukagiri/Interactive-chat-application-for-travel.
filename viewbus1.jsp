<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page import="java.util.*" %>
  <%@ page import="javax.mail.*" %>
  <%@ page import="javax.mail.internet.*" %>
  <%@ page import="javax.activation.*" %>
  <%@ page import="javax.net.ssl.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ChatBot</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/radius.js"></script>
<style type="text/css">
<!--
.style16 {font-size: large}
.style21 {color: #687A66}
.style22 {font-size: medium;
	font-weight: bold;
}
.style22 {font-size: medium; font-weight: bold; color: #687A66; }
.style5 {color: #E1EAF1;
	font-size: 24px;
}
-->
</style>
</head>
<body>
<!-- START PAGE SOURCE -->
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="userpage.jsp">Bus Search  </a></li>
          <li><a href="userlogin.jsp">Logout </a></li>
        </ul>
      </div>
      <div class="logo">
        <h1><a href="index.html">Chat<span>Bot</span></a> <small>Connecting Travel </small></h1>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <form id="form2" name="form2" method="post" action="viewbus.jsp">
            <table width="604" height="224" border="0" >
              <tr>
                <td height="52" colspan="5" bgcolor="#666666"><div align="center"><span class="style5">View All Bus - Connecting all sites </span></div></td>
              </tr>
              <tr>
                <td width="112" bordercolor="#FFFFFF"><div align="center" class="style22">From </div></td>
                <td width="296" bordercolor="#FFFFFF"><div align="center" class="style21"><span class="style22">To</span></div></td>
                <td width="296" bordercolor="#FFFFFF"><div align="center"><span class="style22">Bus Name </span></div></td>
                <td width="296" bordercolor="#FFFFFF"><div align="center"><span class="style22">Fare</span></div></td>
                <td width="296" bordercolor="#FFFFFF"><div align="center"><span class="style22">Company</span></div></td>
              </tr>
              <%
                                        try {
                                         
							//String username, user;
							String username = session.getAttribute("username").toString();
							
							
							String from1 = session.getAttribute("from1").toString();
        String to1 = session.getAttribute("to1").toString();
		
		String traveltype = session.getAttribute("traveltype").toString();
		
		String host = "smtp.gmail.com";
                String from="testmailselva@gmail.com";
                String subject = "Success Report";
				
				HttpSession sn = request.getSession(true);
     sn.setAttribute("from1",from1);
	 sn.setAttribute("to1",to1);
	 sn.setAttribute("traveltype",traveltype);
     
		 
       String email="";
        PreparedStatement ps;
        ResultSet rs,rs1;
		//Connection con = null;
		Statement st,st1,st2,st3,st4;
                                            
                                            Class.forName("com.mysql.jdbc.Driver");
                                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatbot","root","password");
									  
									   String query1 = "select * from register where username='"+username+"'"; 
                                            st1 = con.createStatement();
                                            rs1 = st1.executeQuery(query1);

                                            if(rs1.next()) {
											email = rs1.getString(6);
											}
									  
						
									  
                                            String query = "select * from busdetails where from1='"+from1+"' && to1='"+to1+"' && through='"+traveltype+"' ORDER BY fare ASC"; 
                                            st = con.createStatement();
                                            rs = st.executeQuery(query);

                                            if (rs.next()) {
                                                
                                                String s1 = rs.getString(1);
                                                String s2 = rs.getString(2);
												
												String s3 = rs.getString(3);
                                                String s4 = rs.getString(4);
												
												String s5 = rs.getString(5);
                                            
                                  
                                    %>
              <tr>
                <td><div align="center"><%=s1%></div></td>
                <td><div align="center"><%=s2%></div></td>
                <td><div align="center"><%=s3%></div></td>
                <td><div align="center"><%=s4%></div></td>
                <td><div align="center"><%=s5%></div></td>
              </tr>
              <tr>
                <td colspan="5"><div align="center"></div></td>
              </tr>
              <%
			  
			  
			  			   String messageText = "Your requested bus details are sent : "+s3+","+s4+","+s5;
boolean sessionDebug = true;
// Create some properties and get the default Session.
//System.setProperty("smtp.protocols", "SSLv3");
Properties props = System.getProperties();

props.put("mail.smtp.starttls.enable","true");
props.setProperty("mail.transport.protocol","smtp");
props.setProperty("mail.host",host);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.port", "587");    //port is 587 for TLS  if you use SSL then port is 465
props.put("mail.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.fallback", "false");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

Session mailSession = Session.getInstance(props, new javax.mail.Authenticator()
{
protected PasswordAuthentication getPasswordAuthentication() {return new PasswordAuthentication("UserName", "Password");
}
});
 
// Set debug on the Session
// Passing false will not echo debug info, and passing True will.
 
mailSession.setDebug(sessionDebug);
 
// Instantiate a new MimeMessage and fill it with the
// required information.
 
Message msg = new MimeMessage(mailSession);
msg.setFrom(new InternetAddress(from));
InternetAddress[] address = {new InternetAddress(email)};
msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
//msg.setSentDate(new Date());
msg.setText(messageText);

 
// Hand the message to the default transport service
// for delivery.
 
Transport transport = mailSession.getTransport("smtp");
transport.connect(host, "testmailselva", "5#SelvaJava");
transport.sendMessage(msg, msg.getAllRecipients());

                                            }
                                            con.close();
                                        } catch (Exception e) {
                                            out.println(e);
                                        }

                                    %>
            </table>
          </form>
          <form id="form1" name="form1" method="post" action="viewbus1.jsp">
            <label>
              <div align="center"></div>
            </label>
          </form>
          <h2 align="center">&nbsp;</h2>
          <p class="spec"><a href="#" class="rm"></a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"><span>Sidebar</span> Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="bussearch.jsp">Bus Search </a></li>
            <li><a href="userlogin.jsp">Logout </a></li>
          </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">Copyright &copy;- All Rights Reserved</p>
      <div class="clr"></div>
    </div>
  </div>
</div>
<!-- END PAGE SOURCE -->
<div align=center></div>
</body>
</html>
