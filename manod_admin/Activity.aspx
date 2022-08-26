<%@ Page Title="" Language="C#" MasterPageFile="~/manod_admin/manodishaMasterPage.master" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="manod_admin_Activity" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
    function Validate() {
        if (document.getElementById("<%=txt_headingname.ClientID%>").value == "") {
            alert("Heading Name is Required !");
            document.getElementById("<%=txt_headingname.ClientID%>").focus();
            return false;
        }
    }
      </script>


 <script src="jquery-1.8.2.js" type="text/javascript"></script>
         <script type="text/javascript">
             function showimagepreview(input) {
                 if (input.files && input.files[0]) {
                     var filerdr = new FileReader();
                     filerdr.onload = function (e) {
                         $('#imgorg').attr('src', e.target.result);

                     }
                     filerdr.readAsDataURL(input.files[0]);
                 }
             }
        </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

<div class="breadcrumbs ace-save-state" id="Div1">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
                            <li>
								<a href="ActivityList.aspx">Activity List</a>
							</li>
							<li class="active"> <a href="#">Activity Details</a></li>
						</ul><!-- /.breadcrumb -->
					</div>
                     <!-- /.page-content -->
                       <div class="page-content">

                    <div class="page-header"><h1>Welcome to Activity Details </h1></div>
                      <div class="row">
							<div class="col-xs-12">

                            <div class="form-group">
										<div class="col-sm-12"><span style="font-size:20px;">Heading Name</span><br /><br />
											<div class="pos-rel">
                                                <asp:TextBox ID="txt_headingname" runat="server" type="text" CssClass="col-xs-14 col-sm-9"  placeholder="Enter Heading Name" ToolTip="Heading Name"></asp:TextBox>

											</div>
										</div>
									</div>

                                    <div style="height:20px;clear:both;"></div>
                                     
                                       <div class="form-group">
										<div class="col-sm-12"><span style="font-size:20px;">Activity Description</span><br /><br />
											<div class="pos-rel">
                                                <cc1:Editor ID="edtr_descpn" runat="server" />
                                               
											</div>
										</div>
									</div>

                                    <div style="height:20px;clear:both;"></div>
						
                                   <div class="form-group">
										<label class="col-sm-3 control-label no-padding-right"><span style="font-size:20px;">Upload Site photo</span><br /><br /></label>

										<div class="col-sm-9">
                                        <div style="float:left;width:30%">
											<div class="pos-rel">
												<asp:FileUpload ID="flu_photoImg" runat="server" onchange="showimagepreview(this)"/>
											</div>
                                           </div>

                                           <div style="float:right;width:70%">
                                            <div class="col-xs-12 col-sm-3 left" style="padding-right:40px;">
                                         
												<%--<span class="profile-picture">--%>
													
                                                    <asp:Image ID="imgLogo"  Width="120px" Height="120px" runat="server" />
												<%--</span>--%>

												<div class="space-4"></div>
                                                  <asp:LinkButton ID="lkbUpload" runat="server" 
                                             CssClass="btn btn-purple" onclick="lkbUpload_Click"   >
                                        <span class="ace-icon fa   fa-download bigger-110"></span>
                                     Upload Image
                                        </asp:LinkButton>
											
                                            </div>
                                            </div>
                                         </div>
									</div>
                             
                              <div style="height:20px;clear:both;"></div>

                                     <div class="col-md-offset-3 col-md-9">
                                   <asp:HiddenField ID="hdn_id" runat="server" />
                                      <asp:HiddenField ID="hdn_Autoid" runat="server" /> 
                                         <asp:HiddenField ID="hdn_img" runat="server" />

                                                   <asp:LinkButton ID="Lbn_Submit" runat="server" 
                                             CssClass="btn btn-info" ToolTip="Click Here For Submit Data" 
                                             OnClientClick="return Validate();" onclick="Lbn_Submit_Click"  >
                                        <span class="ace-icon fa fa-check bigger-110"></span>
                                     Submit
                                        </asp:LinkButton>

                                         	
											&nbsp; &nbsp; &nbsp;
								
                                      <asp:LinkButton ID="Lnk_Reset" runat="server"  CssClass="btn" 
                                             ToolTip="Click Here For Reset Data" onclick="Lnk_Reset_Click"   >
                                        <span  class="ace-icon fa fa-undo bigger-110"></span>
                                     Cancel
                                        </asp:LinkButton>

										</div>

							</div>
						</div> 

                    </div>

</asp:Content>

