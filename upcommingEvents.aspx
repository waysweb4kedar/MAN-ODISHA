<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upcommingEvents.aspx.cs" Inherits="upcommingEvents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8" />
	<title>MAN: Manag Autism Now Trust</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style type="text/css">
#aside_award {
	font-family: Arial, Helvetica, sans-serif;
	color: #000;
	padding-right: 5px;
	padding-left: 5px;
	border: 1px solid #CCC;
}
#aside_award p {
	line-height: 20px;
	padding-top: 5px;
}
</style>
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
   <div id="header">
		<div>
       <div id="logo"> <img src="images/logo.jpg" width="400" height="100"></div>
		  <div id="nav"><ul>


                <li><a href="Default.aspx" target="_parent">HOME</a></li> 
				<li><a href="about.html" target="_parent">ABOUT US</a></li>
				<li><a href="atc.html" target="_parent">ATC</a></li>
                <li ><a href="activities.aspx" target="_parent">ACTIVITIES</a></li>
                <li ><a href="press.aspx" target="_parent">PRESS</a></li>
                <li ><a href="gallery.aspx" target="_parent">GALLERY</a></li>
                <li><a href="donate.php" target="_parent">DONATION</a></li> 
				<li><a href="contact.html" target="_parent">CONTACT US</a></li>
			</ul></div>
            
		</div>
	</div>
	<div class="content">
    <div class="banner"><img src="images/Special Invitation _banner.jpg" width="960" height="380"></div>
    <div class="clr"></div>
    <div class="bodyCnt">
    
     <asp:Repeater ID="rptr_upComEvent" runat="server"  >
                 <ItemTemplate>

     <div class="linkDiv"><a href="manod_admin/<%#Eval("eventimgg")%>"><%#Eval("eventname")%> </a></div>

      </ItemTemplate>
                 </asp:Repeater>
     
     <%--<div class="linkDiv"><a href="Gallery/Parents.pdf">Invitation to attend a special seminar cum panel discussion</a></div>
     <div class="linkDiv"><a href="Gallery/student.pdf">Awareness on AUTISM</a></div>--%>
    </div>
    <div class="clr"></div>
	</div>
	<div id="footer">
		<div>
			<div>
				<span>Follow us</span>
				<a href="#" target="_blank" class="facebook">Facebook</a>
				<a href="#" class="subscribe">Subscribe</a>
				<a href="#" target="_blank" class="twitter">Twitter</a>
				<a href="#" target="_blank" class="flicker">Flickr</a>
			</div>
			<ul>
				<li><img src="images/footerClip1st_3.gif" width="214" height="114">
				  <p>"Autism is a way of being. It is pervasive; it colors every experience, every sensation, perception, thought, emotion, and encounter, every aspect of existence.&quot; Courtesy internet…</p>
</li>
				<li><img src="images/footerClip2nd_4.gif" width="214" height="114">
				  <p>"Autism to me, says that I accept my child. I celebrate his differences and his quirky-ness. I am proud of his successes, and I am proud that he is mine." Courtesy internet…</p>
</li>
			</ul>
		</div>
		<p class="footnote">&copy; 2012 Manage Autism Now (MAN) Trust. All Rights Reserved. // Site Design &amp; Developed By <a href="http://www.wayswebdevelopment.com">Ways Web Development</a></p>
	</div>
    </form>
</body>
</html>
