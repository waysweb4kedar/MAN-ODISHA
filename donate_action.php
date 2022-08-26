<?php 
if(isset($_POST['btn_submit']))
{
$currency=$_POST['dd_country'];
$ammount=$_POST['txt_amount'];
$exm_certificate=$_POST['radio'];
$fname=$_POST['txt_firstname'];
$lname=$_POST['txt_lastname'];
$email=$_POST['txt_email'];
$address=$_POST['txt_area'];
$pan_no=$_POST['txt_pan'];
$nationality=$_POST['dd_nationality'];

$to="ommtech@hotmail.com";
$to1="waysweb.development@gmail.com";

$message="Hello!! sir 
		  i am $fname

-------------------------Donation deatails----------------------------------

Currency						:	$currency 

Amount						:	$ammount 

Do You Want Tax Exemption Certificate	:	$exm_certificate

First Name						:	$fname

Last Name						:	$lname

E-mail						:	$email 

Address						:	$address

PAN No						:	$pan_no

Nationality						:	$nationality
.";

$subject="Donation details from manodisha.org";
$from="From:$email";
$send_mail=mail($to,$subject,$message,$from);
if($send_mail)
{
header("location:donate.php?res_suc=success");
}else
{
header("location:donate.php?res_fail=failure");
}
$send_mail1=mail($to1,$subject,$message,$from);
if(($send_mail)&&($send_mail1))
{
header("location:donate.php?res_suc=success");
}else
{
header("location:donate.php?res_fail=failure");
}
}
?>