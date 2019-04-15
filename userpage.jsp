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
            <table width="456" height="291" border="0">
              <tr>
                <td width="219"><span class="style16">From</span></td>
                <td width="227"><label>
                  <input name="from" type="text" id="from" />
                </label></td>
              </tr>
              <tr>
                <td><span class="style16">To</span></td>
                <td><label>
                  <input name="to" type="text" id="to" />
                </label></td>
              </tr>
              
              <tr>
                <td colspan="2"><div align="center">
                  <label>
                  <input type="submit" name="Submit2" value="Search" />
                  </label>
                </div></td>
              </tr>
            </table>
          </form>
          <h2>&nbsp;</h2>
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
