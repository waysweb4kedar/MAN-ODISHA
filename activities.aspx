<%@ Page Language="C#" AutoEventWireup="true" CodeFile="activities.aspx.cs" Inherits="activities" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset="UTF-8" />
	<title>MAN: Manag Autism Now Trust</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />

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
                <li class="current"><a href="activities.aspx" target="_parent">ACTIVITIES</a></li>
                <li><a href="press.aspx" target="_parent">PRESS</a></li>
                <li><a href="gallery.aspx" target="_parent">GALLERY</a></li>
                <li><a href="donate.php" target="_parent">DONATION</a></li> 
				<li><a href="contact.html" target="_parent">CONTACT US</a></li>
			</ul></div>
             
		</div>
	</div>
<div class="content">
		<div>
			<div><img src="images/activities_banner.jpg" width="960" height="380"></div>
			<div>
				<div id="sidebar">
				  <div class="sidebar_bg">
				    <h2>Our INTERVENTION</h2>
				    <p>Behavioural Therapy </p>
				    <p>Social skills training</p>
				    <p>Speech Therapy </p>
				    <p>Therapy through yoga and meditation</p>
				    <p>Learning through computers</p>
				    <p>Alternative mode to develop communication skills</p>
				    <p>Sensory Integration (S.I) Therapy</p>
				    <p>Ayurvedic treatment (Massage)</p>
				    <p>Therapy through music and dance.</p>
			      </div>
				</div>
			  <div id="aside">
				<h1>Workshops/Seminars</h1>

                   <asp:Repeater ID="rptr_Activity" runat="server"  >
                 <ItemTemplate>
<h2><%#Eval("headingName")%></h2>

<div id="activityPara" runat="server">
<img src="manod_admin/AdminImg/<%#Eval("ActvtImgg")%>" width="350" align="right" class="image">
<p> <%#Eval("ActivtDescp")%></p>
  </div>

   </ItemTemplate>
                 </asp:Repeater>

</div>
			</div>
		</div>
	</div>
	<div id="footer">
	  <div>
	    <div> <span>Follow us</span> 
        <a href="#" target="_blank" class="facebook">Facebook</a> 
        <a href="#" class="subscribe">Subscribe</a> 
        <a href="#" target="_blank" class="twitter">Twitter</a> 
        <a href="#" target="_blank" class="flicker">Flickr</a> </div>
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
