<%@ Page Language="C#" AutoEventWireup="true" enableEventValidation="false" CodeFile="Default.aspx.cs" Inherits="manod_admin_Default" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Admin Login - MAN ODISHA</title>

		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
</head>
<body class="login-layout">
    <form id="form1" runat="server">
    <div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
					  <div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Admin</span>
									<span class="white" id="id-text2">Login</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Man Odisha</h4>
							</div>

							<div class="space-6"></div>

					    <div class="position-relative">
					      <div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<%--<input type="text" class="form-control" placeholder="Username" />--%>
															<i class="ace-icon fa fa-user"></i>
                                                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder=" User Name"  ToolTip="User Name">
                                                             
                                                            </asp:TextBox>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<%--<input type="password" class="form-control" placeholder="Password" />--%>
															<i class="ace-icon fa fa-lock"></i>
                                                             <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder=" Password" TextMode="Password" ToolTip="Password"></asp:TextBox>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														
                                                          <asp:LinkButton ID="btn_Login" runat="server" 
                                            CssClass="width-35 pull-right btn btn-sm btn-primary" ToolTip="Click Here For Login" onclick="btn_Login_Click"    
                                                          >
                                        <span class="ace-icon fa fa-key"></span>
                                        Login
                                        </asp:LinkButton>


													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											

											<div class="space-6"></div>

											
										</div><!-- /.widget-main -->

									  <div class="toolbar clearfix" style="text-align:center;padding-top:2px;padding-bottom:2px;">
                                        
												<a href="http://www.wayswebdevelopment.com" data-target="#signup-box" class="user-signup-link">
													Powered By Ways Web Development
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											
										</div>
									</div><!-- /.widget-body -->
						    </div><!-- /.login-box --><!-- /.forgot-box --><!-- /.signup-box -->
							</div><!-- /.position-relative --></div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		    jQuery(function ($) {
		        $(document).on('click', '.toolbar a[data-target]', function (e) {
		            e.preventDefault();
		            var target = $(this).data('target');
		            $('.widget-box.visible').removeClass('visible'); //hide others
		            $(target).addClass('visible'); //show target
		        });
		    });



		    //you don't need this, just used for changing background
		    jQuery(function ($) {
		        $('#btn-login-dark').on('click', function (e) {
		            $('body').attr('class', 'login-layout');
		            $('#id-text2').attr('class', 'white');
		            $('#id-company-text').attr('class', 'blue');

		            e.preventDefault();
		        });
		        $('#btn-login-light').on('click', function (e) {
		            $('body').attr('class', 'login-layout light-login');
		            $('#id-text2').attr('class', 'grey');
		            $('#id-company-text').attr('class', 'blue');

		            e.preventDefault();
		        });
		        $('#btn-login-blur').on('click', function (e) {
		            $('body').attr('class', 'login-layout blur-login');
		            $('#id-text2').attr('class', 'white');
		            $('#id-company-text').attr('class', 'light-blue');

		            e.preventDefault();
		        });

		    });
		</script>
    </form>
</body>
</html>
