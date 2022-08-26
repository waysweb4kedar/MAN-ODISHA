<%@ Page Title="" Language="C#" MasterPageFile="~/manod_admin/manodishaMasterPage.master" AutoEventWireup="true" CodeFile="ChangePwd.aspx.cs" Inherits="manod_admin_ChangePwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li><li class="active">Change Password</li>
						</ul>
					</div>

                     <!-- /.page-content -->
 <div class="page-content">
                    <div class="page-header"><h1>Welcome to Change Password </h1></div>
                      <div class="row">
							<div class="col-xs-12">

								<div class="form-group">
                                
										<div class="col-sm-12">
											<div class="pos-rel">
                                                <asp:TextBox ID="txt_CurPwd" runat="server" type="text" CssClass="col-xs-14 col-sm-9" placeholder="Enter Current Password" ToolTip=" Current Password"></asp:TextBox>
											</div>
										</div>
									</div>

                                    <div style="height:20px;clear:both;"></div>

                                    <div class="form-group">
                                    
										<div class="col-sm-12">
											<div class="pos-rel">
                                                <asp:TextBox ID="txt_NewPwd" runat="server" type="text"  CssClass="col-xs-14 col-sm-9" placeholder="Enter New Password" ToolTip=" New Password "></asp:TextBox>
											</div>
										</div>
									</div>

                                    <div style="height:20px;clear:both;"></div>

                                    <div class="form-group">
                                  
										<div class="col-sm-12">
											<div class="pos-rel">
                                                <asp:TextBox ID="txt_ConfPwd" runat="server" type="text" CssClass="col-xs-14 col-sm-9" placeholder="Enter Confirm Password" ToolTip="Confirm Password "></asp:TextBox>
											</div>
										</div>
									</div>
                                  
                                    <div style="height:20px;clear:both;"></div>
                             
                                     <div class="col-md-offset-3 col-md-9">
                                     <asp:HiddenField ID="hdn_id" runat="server" />
                                      <asp:HiddenField ID="hdn_Autoid" runat="server"  />

                                                   <asp:LinkButton ID="Lbn_Submit" runat="server" 
                                             CssClass="btn btn-info" ToolTip="Click Here For Submit Data" onclick="Lbn_Submit_Click" 
                                              >
                                        <span class="ace-icon fa fa-check bigger-110"></span>
                                     Submit
                                        </asp:LinkButton>

                                         	
											&nbsp; &nbsp; &nbsp;
								
                                      <asp:LinkButton ID="Lnk_Reset" runat="server"  CssClass="btn" 
                                             ToolTip="Click Here For Reset Data" onclick="Lnk_Reset_Click"   >
                                        <span  class="ace-icon fa fa-undo bigger-110"></span>
                                     Reset
                                        </asp:LinkButton>

										</div>

                                        <div style="height:20px;clear:both;"></div>

							</div>
						</div> 

                    </div>

</asp:Content>

