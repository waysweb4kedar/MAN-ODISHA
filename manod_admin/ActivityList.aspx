<%@ Page Title="" Language="C#" MasterPageFile="~/manod_admin/manodishaMasterPage.master" AutoEventWireup="true" CodeFile="ActivityList.aspx.cs" Inherits="manod_admin_ActivityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <style>
        .invisibletext
{
    visibility:hidden;
}
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
                            
							<li class="active"> <a href="#">Activity List</a></li>
						</ul><!-- /.breadcrumb -->
					</div>

                    <!-- /.page-content -->
                    <div class="page-content">

<div class="page-header">
							<h1>Activity List</h1>
						</div>
<div class="alert alert-info" >

</div>

<div class="row">
									<div class="col-xs-12">

                                    <div class="col-xs-6">
                                    <div class="input-group">
									<%--<span class="input-group-addon">--%>
									<%--<i class="ace-icon fa fa-check"></i>--%>
									<%--</span>--%>
                                        <%--<asp:TextBox ID="txt_search" runat="server" CssClass="form-control search-query" placeholder="Search by Gender/Name !"></asp:TextBox>--%>

                                    <%--<input type="text" class="form-control search-query" placeholder="Type your query" />--%>
									<%--<span class="input-group-btn">
                                        <asp:LinkButton ID="btn_search" runat="server" 
                                            CssClass="btn btn-inverse btn-white" >
                                        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                        Search
                                        </asp:LinkButton>

                                    </span>--%>
									</div>
                                    </div>
                                   
                                    <div class="col-xs-6" 
                                            style="text-align:right;padding-right:5.0em; top: 0px; left: 0px;">
                                  
                                    <asp:LinkButton ID="lnb_newactivity" runat="server" CssClass="btn btn-primary" onclick="lnb_newactivity_Click" 
                                           > <span class="ace-icon fa  fa-pencil-square-o icon-on-right bigger-110"></span>Add New Activity </asp:LinkButton>
                                        
                                    
                                    </div>
                                    <div class="clearfix" style="margin-top:65px;"></div>

								<div style="overflow:scroll;height:875px;">
                                        
                                        <asp:GridView ID="grd_activity" runat="server" CssClass="table  table-bordered table-hover"
                                       AutoGenerateColumns="False"  PageSize="15" AllowPaging="True" 
                                            onpageindexchanging="grd_activity_PageIndexChanging" 
                                            onrowdatabound="grd_activity_RowDataBound" 
                                            onrowdeleting="grd_activity_RowDeleting" 
                                            onrowupdating="grd_activity_RowUpdating"   >
                                        <Columns>
                                            <asp:TemplateField HeaderText="SlNo">
                                                <HeaderStyle HorizontalAlign="Left" Width="5%" />
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>

                                            </asp:TemplateField>

                                            <asp:BoundField DataField="ActivtyId" HeaderText="Activity Id">
                                            </asp:BoundField> 
                                            
                                             <asp:BoundField DataField="headingName" HeaderText="Heading Name">
                                            </asp:BoundField>

                                          
                                              <asp:TemplateField ShowHeader="False" HeaderText="Activity Image">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="50px" Width="60px" ImageUrl='<%#Eval("ActvtImgg") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                         <asp:ButtonField ButtonType="Image" HeaderText="Edit"
                                                ImageUrl="~/images/icn_edit.png" Text="Button" CommandName="Update">
                                                <HeaderStyle Width="6%" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:ButtonField>

                                            <asp:TemplateField ShowHeader="False" HeaderText="Delete">
                                            <ItemTemplate>
                                            <asp:ImageButton ID="LinkDelete" ImageUrl="~/images/icn_trash.png" runat="server" ToolTip="Click For Delete Data" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry?');"></asp:ImageButton>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                            <asp:BoundField DataField="Id" HeaderText="id">
                                                <HeaderStyle CssClass="invisibletext" Width="1%" />
                                                <ItemStyle CssClass="invisibletext" />
                                            </asp:BoundField>
                                        </Columns>

                                        </asp:GridView>
                                        </div>
									</div><!-- /.span -->
								</div>

                                </div>

</asp:Content>

