<?php
$msg="";
if(isset($_GET['res_suc']))
{
	$msg="Thank you for Submitting your query successfully. <br />
Soon Our Representative will Contact You";
	}elseif(isset($_GET['res_fail']))
{
	$msg="Sorry please try again!";
	}
?>

<?php

require_once('recaptchalib.php');

// Get a key from https://www.google.com/recaptcha/admin/create
$publickey = "6LdBGOgSAAAAAPITqwT8SxKCDwYhfCyHQvC1HRtw";
$privatekey = "6LdBGOgSAAAAANEuRhN5T6n3GaFDhLqVuYXIuOpU";

# the response from reCAPTCHA
$resp = null;
# the error code from reCAPTCHA, if any
$error = null;
# was there a reCAPTCHA response?
if(!empty($_POST)){	
	if(!empty($_POST["recaptcha_response_field"])){		
		if($_POST["recaptcha_response_field"]) {				
				$resp = recaptcha_check_answer ($privatekey,
												$_SERVER["REMOTE_ADDR"],
												$_POST["recaptcha_challenge_field"],
												$_POST["recaptcha_response_field"]);
		
				if ($resp->is_valid) {
						require_once('donate_action.php');
						print "<script>";
						print "alert('Query submitted successfully');";
						print "</script>";
				} else {
						# set the error code so that we can display it
						$error = $resp->error;
						echo "The reCAPTCHA wasn't entered correctly. Go back and try it again";
				}
		}
	}else{
		$error ="Please enter.";
	}
}
?>

<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8" />
	<title>MAN: Manag Autism Now Trust</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	<!--[if IE 6]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]-->
</head>
<body>
		<div id="header">
		<div>
       <div id="logo"> <img src="images/logo.jpg" width="420" height="100"></div>
		  <div id="nav"><ul>
<li><a href="index.html" target="_parent">HOME</a></li>
				<li><a href="about.html" target="_parent">ABOUT US</a></li>
				<li><a href="atc.html" target="_parent">ATC</a></li>
                <li><a href="activities.html" target="_parent">ACTIVITIES</a></li>
                <li><a href="press.html" target="_parent">PRESS</a></li>
                <li><a href="gallery.html" target="_parent">GALLERY</a></li>
                <li class="current"><a href="donate.php" target="_parent">DONATION</a></li>
				<li><a href="contact.html" target="_parent">CONTACT US</a></li>
			</ul></div>
             
		</div>
	</div>
	<div class="content">
		<div>
			<div><img src="images/donate_banner.jpg" width="960" height="380"></div>
			<div>
				<div id="sidebar">
				  <div class="sidebar_bg">
				    <h2>Our Bank Details</h2>
<p>NAME: Manage Autism Now(MAN)</p>
<p>A/C No: 889799533</p>
<p>IFSC Code: IDIB000P170</p>
<p>Bank: INDIAN BANK,Patia Branch,Bhubaneswar</p>

  </div>

		    </div>
			  <div id="aside">
				<h1>Through your will</h1>
                <p>Donations to the <strong>MAN(Manage Autism Now)</strong> Trust are eligible for tax exemption under section 80-G(5)(vi) of Income Tax Act, 1961" vide order no.<strong>CIT/CTC/Tech/80(G)-540/2011-12</strong> dated,Cuttack,the 30th August’2011  w.e.f. 07.04.2011 onwards.</p>
                <p><?php echo  $msg;?></p>
                <form id="form1" name="f1" method="post" onSubmit=" return rule();" action="donate_action.php">
              <table width="100%" border="0" align="center" cellpadding="2">
                <tr class="table_alternate_row">
                  <td width="45%"><div align="right"><strong>Select  Currency</strong></div></td>
                  <td width="55%"><label>
                      <select name="dd_country" id="dd_country">
                        <option selected="selected">INDIAN RUPEE (INR) </option>
                        <option>UNITED STATES DOLLAR (USD) </option>
                        <option>GREAT BRITAIN POUND (GBP)</option>
                        <option>EUROPEAN DOLLAR (EURO)</option>
                        <option>AUSTRALIAN DOLLAR (AUSD) </option>
                        <option>HONG KONG DOLLAR (HKD)</option>
                      </select>
                    </label></td>
                </tr>
                <tr class="table_alterrow">
                  <td><div align="right"><strong>Amount</strong></div></td>
                  <td><label>
                      <input name="txt_amount" type="text" id="txt_amount" size="20" />
                    </label></td>
                </tr>
                <tr class="table_alternate_row">
                  <td><div align="right"><strong>Do  You Want Tax Exemption Certificate</strong></div></td>
                  <td><p>
                      <label>
                        <input type="radio" name="radio" value="yes" id="yes" />
                        Yes</label>
                      <label>
                        <input type="radio" name="radio" value="no" id="no" />
                        No</label>
                    </p></td>
                </tr>
                <tr class="table_alterrow">
                  <td colspan="2" class="highlight_paratext">Please  enter your Mailling Address</td>
                </tr>
                <tr class="table_alternate_row">
                  <td><div align="right"><strong>First  Name </strong></div></td>
                  <td><label>
                      <input name="txt_firstname" type="text" id="txt_firstname" size="40" />
                    </label></td>
                </tr>
                <tr class="table_alterrow">
                  <td><div align="right"><strong>Last  Name </strong></div></td>
                  <td><label>
                      <input name="txt_lastname" type="text" id="txt_lastname" size="40" />
                    </label></td>
                </tr>
                <tr class="table_row">
                  <td><div align="right"><strong>Email</strong></div></td>
                  <td><label>
                      <input name="txt_email" type="text" id="txt_email" size="40" />
                    </label></td>
                </tr>
                <tr class="table_alternate_row">
                  <td><div align="right"><strong>Address </strong></div></td>
                  <td><label>
                      <textarea name="txt_area" id="txt_area" cols="45" rows="5"></textarea>
                    </label></td>
                </tr>
                <tr class="table_row">
                  <td><div align="right"><strong>PAN  No</strong></div></td>
                  <td><label>
                      <input name="txt_pan" type="text" id="txt_pan" size="40" />
                    </label></td>
                </tr>
                <tr class="table_alternate_row">
                  <td><div align="right"><strong>Nationality  *</strong></div></td>
                  <td><label>
                      <select name="dd_nationality" id="dd_nationality">
                        <option>Afghanistan</option>
                        <option>Albania</option>
                        <option>Algeria</option>
                        <option selected="selected">American Samoa</option>
                        <option>Andorra</option>
                        <option>Angola</option>
                        <option>Anguilla</option>
                        <option>Antarctica</option>
                        <option>Antigua and Barbuda</option>
                        <option>Argentina</option>
                        <option>Armenia</option>
                        <option>Aruba</option>
                        <option>Ascension Island</option>
                        <option>Australia</option>
                        <option>Austria</option>
                        <option>Azerbaijan</option>
                        <option>Bahamas</option>
                        <option>Bahrain</option>
                        <option>Bangladesh</option>
                        <option>Barbados</option>
                        <option>Belarus</option>
                        <option>Belgium</option>
                        <option>Belize</option>
                        <option>Benin</option>
                        <option>Bermuda</option>
                        <option>Bhutan</option>
                        <option>Bolivia</option>
                        <option>Bosnia and Herzegovina</option>
                        <option>Botswana</option>
                        <option>Bouvet Island</option>
                        <option>Brazil</option>
                        <option>British Indian Ocean Territory</option>
                        <option>Brunei Darussalam</option>
                        <option>Bulgaria</option>
                        <option>Burkina Faso</option>
                        <option>Burundi</option>
                        <option>Cambodia</option>
                        <option>Cameroon</option>
                        <option>Canada</option>
                        <option>Cape Verde</option>
                        <option>Cayman Islands</option>
                        <option>Central African Republic</option>
                        <option>Chad</option>
                        <option>Chile</option>
                        <option>China</option>
                        <option>Christmas Island</option>
                        <option>Cocos (Keeling) Islands</option>
                        <option>Colombia</option>
                        <option>Comoros</option>
                        <option>Democratic Republic of the Congo (Kinshasa)</option>
                        <option>Congo, Republic of (Brazzaville)</option>
                        <option>Cook Islands</option>
                        <option>Costa Rica</option>
                        <option>Ivory Coast</option>
                        <option>Croatia</option>
                        <option>Cuba</option>
                        <option>Cyprus</option>
                        <option> Czech Republic</option>
                        <option>Denmark</option>
                        <option>Djibouti</option>
                        <option> Dominica</option>
                        <option>Dominican Republic</option>
                        <option>East Timor Timor-Leste</option>
                        <option>Ecuador</option>
                        <option> Egypt</option>
                        <option> El Salvador</option>
                        <option>Equatorial Guinea</option>
                        <option>Eritrea</option>
                        <option>Estonia</option>
                        <option> Ethiopia</option>
                        <option>Falkland Islands</option>
                        <option>Faroe Islands</option>
                        <option>Fiji</option>
                        <option>Finland</option>
                        <option>France</option>
                        <option>French Guiana</option>
                        <option>French Metropolitan</option>
                        <option>French Polynesia</option>
                        <option>French Southern Territories</option>
                        <option>Gabon</option>
                        <option>Gambia</option>
                        <option>Georgia</option>
                        <option>Germany</option>
                        <option>Ghana</option>
                        <option>Gibraltar</option>
                        <option>Great Britain</option>
                        <option>Greece</option>
                        <option>Greenland</option>
                        <option>Grenada</option>
                        <option>Guadeloupe</option>
                        <option>Guam</option>
                        <option>Guatemala</option>
                        <option>Guernsey</option>
                        <option>Guinea</option>
                        <option>Guinea-Bissau</option>
                        <option>Guyana</option>
                        <option>Haiti</option>
                        <option>Heard and Mc Donald Islands</option>
                        <option>Holy See</option>
                        <option>Honduras</option>
                        <option>Hong Kong</option>
                        <option>Hungary</option>
                        <option>Iceland</option>
                        <option>India</option>
                        <option>Indonesia</option>
                        <option>Iran (Islamic Republic of)</option>
                        <option>Iraq</option>
                        <option>Ireland</option>
                        <option>Isle of Man</option>
                        <option> Israel</option>
                        <option>Italy</option>
                        <option>Jamaica</option>
                        <option>Japan</option>
                        <option>Jersey</option>
                        <option>Jordan</option>
                        <option>Kazakhstan</option>
                        <option>Kenya</option>
                        <option>Kiribati</option>
                        <option>Korea, Democratic People's Rep. (North Korea)</option>
                        <option>Korea, Republic of (South Korea)</option>
                        <option>Kosovo</option>
                        <option>Kuwait</option>
                        <option>Kyrgyzstan</option>
                        <option> Lao, People's Democratic Republic</option>
                        <option>Latvia</option>
                        <option>Lebanon</option>
                        <option>Lesotho</option>
                        <option>Liberia</option>
                        <option>Libya</option>
                        <option>Liechtenstein</option>
                        <option>Lithuania</option>
                        <option>Luxembourg</option>
                        <option>Macau</option>
                        <option>Macedonia, Rep. of</option>
                        <option>Madagascar</option>
                        <option>Malawi</option>
                        <option>Malaysia</option>
                        <option>Maldives</option>
                        <option>Mali</option>
                        <option>Malta</option>
                        <option>Marshall Islands</option>
                        <option>Martinique</option>
                        <option>Mauritania</option>
                        <option>Mauritius</option>
                        <option>Mayotte</option>
                        <option>Mexico</option>
                        <option>Micronesia, Federal States of</option>
                        <option>Moldova, Republic of</option>
                        <option>Monaco</option>
                        <option>Mongolia</option>
                        <option>Montenegro</option>
                        <option>Montserrat</option>
                        <option>Morocco</option>
                        <option>Mozambique</option>
                        <option>Myanmar, Burma </option>
                        <option> Namibia</option>
                        <option>Nauru</option>
                        <option>Nepal</option>
                        <option>Netherlands</option>
                        <option>Netherlands Antilles</option>
                        <option>New Caledonia</option>
                        <option>New Zealand</option>
                        <option>Nicaragua</option>
                        <option>Niger</option>
                        <option>Nigeria</option>
                        <option>Niue</option>
                        <option>Norfolk Island</option>
                        <option>Northern Mariana Islands</option>
                        <option>Norway</option>
                        <option>Oman</option>
                        <option>Pakistan</option>
                        <option>Palau</option>
                        <option>Palestinian National Authority</option>
                        <option>Panama</option>
                        <option>Papua New Guinea</option>
                        <option>Paraguay</option>
                        <option>Peru</option>
                        <option>Philippines</option>
                        <option>Pitcairn Island</option>
                        <option>Poland</option>
                        <option>Portugal</option>
                        <option>Puerto Rico</option>
                        <option>Qatar</option>
                        <option>Reunion Island</option>
                        <option>Romania</option>
                        <option>Russian Federation</option>
                        <option>Rwanda</option>
                        <option>Saint Kitts and Nevis</option>
                        <option>Saint Lucia</option>
                        <option>Saint Vincent and the Grenadines</option>
                        <option>Samoa</option>
                        <option>San Marino</option>
                        <option>Sao Tome and Príncipe</option>
                        <option>Saudi Arabia</option>
                        <option>Senegal</option>
                        <option>Serbia</option>
                        <option>Seychelles</option>
                        <option>Sierra Leone</option>
                        <option>Singapore</option>
                        <option>Slovakia (Slovak Republic)</option>
                        <option>Slovenia</option>
                        <option>Solomon Islands</option>
                        <option>Somalia</option>
                        <option>South Africa</option>
                        <option> South Georgia and South Sandwich Islands</option>
                        <option>South Sudan</option>
                        <option>Spain</option>
                        <option>Sri Lanka</option>
                        <option>Saint Helena</option>
                        <option>St. Pierre and Miquelon</option>
                        <option>Sudan</option>
                        <option>Suriname</option>
                        <option>Svalbard and Jan Mayen Islands</option>
                        <option>Swaziland</option>
                        <option>Sweden</option>
                        <option>Switzerland</option>
                        <option>Syria, Syrian Arab Republic</option>
                        <option>Taiwan (Republic of China)</option>
                        <option>Tajikistan</option>
                        <option>Tanzania</option>
                        <option>Thailand</option>
                        <option>Tibet</option>
                        <option>Timor-Leste (East Timor)</option>
                        <option>Togo</option>
                        <option>Tokelau</option>
                        <option>Tonga</option>
                        <option>Trinidad and Tobago</option>
                        <option>Tunisia</option>
                        <option>Turkey</option>
                        <option>Turkmenistan</option>
                        <option>Turks and Caicos Islands</option>
                        <option>Tuvalu</option>
                        <option>Uganda</option>
                        <option>Ukraine</option>
                        <option>United Arab Emirates</option>
                        <option>United Kingdom</option>
                        <option>United States</option>
                        <option>U.S. Minor Outlying Islands</option>
                        <option>Uruguay</option>
                        <option>Uzbekistan</option>
                        <option> Vanuatu</option>
                        <option>Vatican City State (Holy See)</option>
                        <option>Venezuela</option>
                        <option>Vietnam</option>
                        <option>Virgin Islands (British)</option>
                        <option>Virgin Islands (U.S.)</option>
                        <option>Western Sahara</option>
                        <option>Yemen</option>
                        <option>Zaire (see Congo, Democratic People's Republic) </option>
                        <option>Zambia</option>
                        <option>Zimbabwe</option>
                      </select>
                    </label></td>
                </tr>
                <tr class="table_alternate_row">
                  <td><div align="right"><strong>Enter Code*</strong></div></td>
                  <td><?php
          require_once('recaptchalib.php');
          $publickey = "6LdBGOgSAAAAAPITqwT8SxKCDwYhfCyHQvC1HRtw"; // you got this from the signup page
          echo recaptcha_get_html($publickey);
        ?></td>
                </tr>
                <tr class="table_end_row">
                  <td>&nbsp;</td>
                  <td><label>
                    <input type="reset" name="btn_reset" id="btn_reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="btn_submit" id="btn_submit" value="Submit" /> </label></td>
                </tr>
              </table>
            </form>
                
			  </div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div>
			<div>
				<span>Follow us</span>
				<a href="http://facebook.com/freewebsitetemplates" target="_blank" class="facebook">Facebook</a>
				<a href="#" class="subscribe">Subscribe</a>
				<a href="http://twitter.com/fwtemplates" target="_blank" class="twitter">Twitter</a>
				<a href="http://www.flickr.com/freewebsitetemplates/" target="_blank" class="flicker">Flickr</a>
			</div>
			<ul>
				<li><img src="images/footerClip1st_1.gif" width="214" height="114">
				  <p>"Autism is a way of being. It is pervasive; it colors every experience, every sensation, perception, thought, emotion, and encounter, every aspect of existence.&quot; Courtesy internet…</p>
</li>
				<li><img src="images/footerClip2nd_3.gif" width="214" height="114">
				  <p>"Autism to me, says that I accept my child. I celebrate his differences and his quirky-ness. I am proud of his successes, and I am proud that he is mine." Courtesy internet…</p>
</li>
			</ul>
		</div>
		<p class="footnote">&copy; 2012 Manage Autism Now (MAN) Trust. All Rights Reserved. // Site Design &amp; Developed By <a href="http://www.wayswebdevelopment.com">Ways Web Development</a></p>
	</div>
</body>
</html>