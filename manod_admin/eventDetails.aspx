<%@ Page Title="" Language="C#" MasterPageFile="~/manod_admin/manodishaMasterPage.master" AutoEventWireup="true" CodeFile="eventDetails.aspx.cs" Inherits="manod_admin_eventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="breadcrumbs ace-save-state" id="Div1">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
                            <li>
								<a href="eventList.aspx">Event List</a>
							</li>
							<li class="active"> <a href="#">Event Details</a></li>
						</ul><!-- /.breadcrumb -->
					</div>
                     <!-- /.page-content -->
                       <div class="page-content">

                    <div class="page-header"><h1>Welcome to Event Details </h1></div>
                      <div class="row">
							<div class="col-xs-12">
                                     
                                       <div class="form-group">
										<div class="col-sm-12"><span style="font-size:20px;">Event Name</span><br /><br />
											<div class="pos-rel">
                                                <asp:TextBox ID="txt_eventname" runat="server" type="text" TextMode="MultiLine" CssClass="col-xs-14 col-sm-9"  placeholder="Enter Event Name" ToolTip="Event Name"></asp:TextBox>
                                               
											</div>
										</div>
									</div>

                                    <div style="height:20px;clear:both;"></div>
						
                                      <div class="form-group">
										<div class="col-sm-12"><span style="font-size:20px;">Upoad File</span><br /><br />
											<div class="pos-rel">
                                                <asp:FileUpload ID="flu_filepdf" runat="server" />
                                               
											</div>
										</div>
									</div>
                             
                              <div style="height:20px;clear:both;"></div>

                                     <div class="col-md-offset-3 col-md-9">
                                   <asp:HiddenField ID="hdn_id" runat="server" />
                                      <asp:HiddenField ID="hdn_Autoid" runat="server" /> 

                                                   <asp:LinkButton ID="Lbn_Submit" runat="server" 
                                             CssClass="btn btn-info" ToolTip="Click Here For Submit Data" 
                                             OnClientClick="return Validate();" onclick="Lbn_Submit_Click"  >
                                        <span class="ace-icon fa fa-check bigger-110"></span>
                                     Submit
                                        </asp:LinkButton>

                                         	
											&nbsp; &nbsp; &nbsp;
								
                                      <asp:LinkButton ID="Lnk_Cancel" runat="server"  CssClass="btn" 
                                             ToolTip="Click Here For Reset Data" onclick="Lnk_Cancel_Click"   >
                                        <span  class="ace-icon fa fa-undo bigger-110"></span>
                                     Cancel
                                        </asp:LinkButton>

										</div>

							</div>
						</div> 

                    </div>
</asp:Content>

