<%@ Page Language="C#" AutoEventWireup="true" CodeFile="press.aspx.cs" Inherits="press" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
	<title>MAN: Manag Autism Now Trust</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
<style type="text/css" media="screen">
			* {
	padding: 0;
	margin: 0;
}
			
			h1 { font-family: Georgia; font-style: italic; margin-bottom: 10px; }
			
			h2 {
				font-family: Georgia;
				font-style: italic;
				margin: 25px 0 5px 0;
			}
			
			p { font-size: 1.2em; }
			
			ul li { display: inline; }
			
			.wide {
				border-bottom: 1px #000 solid;
				width: 4000px;
			}
			
			.fleft { float: left; margin: 0 20px 0 0; }
			
			.cboth { clear: both; }
			
			#main {
				background: #fff;
				margin: 0 auto;
				padding: 30px;
				width: 1000px;
			}
		</style>
<!--Light Box Script start Here-->

<link rel="stylesheet" href="engine/css/vlightbox1.css" type="text/css" />
<link rel="stylesheet" href="engine/css/visuallightbox.css" type="text/css" media="screen" />
<script src="engine/js/jquery.min.js" type="text/javascript"></script>
<script src="engine/js/visuallightbox.js" type="text/javascript"></script>
<script src="engine/js/vlbdata.js" type="text/javascript"></script>
<!--Light Box Script End Here-->
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
                <li class="current"><a href="press.aspx" target="_parent">PRESS</a></li>
                <li ><a href="gallery.aspx" target="_parent">GALLERY</a></li>
                <li><a href="donate.php" target="_parent">DONATION</a></li> 
				<li><a href="contact.html" target="_parent">CONTACT US</a></li>
			</ul></div>
             
		</div>
	</div>
	<div class="content">
		<div>
			<div><img src="images/about_banner.jpg" width="960" height="380"></div>
			<div>
				<div id="sidebar">
				 <div class="sidebar_bg">
							<h2>Our Vision</h2>
				   <p>An organization that aims at providing equal opportunities for all.</p>
                            <p>We consider each one’s ability as an asset and use it as a tool to groom the potential of individuals with autism.</p>
                            <p>Being empowered, they become a part of the mainstream society.</p>
                 </div>
					<br />
						<div class="sidebar_bg">
							<h2>Our Mission</h2>
						  <p>A real anxiety free environment.</p>
<p>Soothing open space.</p>
<p>Accepting individuals with ASD exactly what they are.</p>
<p>Encouraging flexibility in thinking and managing behaviour.</p>
<p>To equip families of persons with autism to deal with their children effectively.</p>
</div>
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
		    <br ?>
						<div class="sidebar_bg">
							<h2>Our future plans</h2>
						  <p>Respite care</p>
<p>Mother and child with ASD training programmes.</p>
<p>Workshops/Seminars</p>
<p>Awareness Programmes</p>
<p>Pre-vocational and vocational training to children with ASD</p>
<p>Concept of independent living (IL)</p>
<p>Sensory Integration Therapy Unit</p>
</div>
<br />
			  </div>
				<div id="aside">
					<h1>Press Release</h1>
					<div id="gallery">
                  <ul class="gallery clearfix">
                  <table cellpadding="5" cellspacing="5">
                  <tr>
                   <td>
                  <asp:Repeater ID="rptr_pressImgg" runat="server"  >
                 <ItemTemplate>

                 <li><a class="vlightbox1" href="manod_admin/AdminImg/<%#Eval("pressImgg")%>" rel="prettyPhoto[gallery1]" title="<%#Eval("pressDesc")%>"><img src="manod_admin/AdminImg/<%#Eval("pressImgg")%>" alt="MAN Odisha Press Release" width="120" height="96" class="gallery_image" /></a></li> 
                    </ItemTemplate>
                 </asp:Repeater>
                 </td>
				
</tr>

 </table>      
  <br />
	  </ul>
</div>

  <div id="Div1" >   <div id="next_page" runat="server">
                      
                    </div></div>

                  </div>

</div>
			</div>
		</div>
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
				<li>
					<a href="#"><img src="images/playing-in-grass.gif" alt="Image" /></a>
					<p>"Autism is a way of being. It is pervasive; it colors every experience, every sensation, perception, thought, emotion, and encounter, every aspect of existence.&quot; Courtesy internet…</p>
</li>
				<li>
					<a href="#"><img src="images/baby-smiling.gif" alt="Image" /></a>
					<p>"Autism to me, says that I accept my child. I celebrate his differences and his quirky-ness. I am proud of his successes, and I am proud that he is mine." Courtesy internet…</p>
</li>
			</ul>
		</div>
		<p class="footnote">&copy; 2012 Manage Autism Now (MAN) Trust. All Rights Reserved. // Site Design &amp; Developed By <a href="http://www.wayswebdevelopment.com">Ways Web Development</a></p>
	</div>
    </form>
</body>
</html>
