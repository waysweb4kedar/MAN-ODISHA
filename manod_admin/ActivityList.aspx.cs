﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manod_admin_ActivityList : System.Web.UI.Page
{
    sqlmanodisha conmanodisha = new sqlmanodisha();
    SqlCommand cmd;
    SqlDataReader rd;
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Showdata();
        }
    }
    public void Showdata()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        con.Open();
        da = new SqlDataAdapter("select Id,ActivtyId,headingName,ActivtDescp,ActvtImgg='../manod_admin/AdminImg/'+ActvtImgg  from tbl_Activity order by Id desc", con);
        ds = new DataSet();
        da.Fill(ds);
        grd_activity.DataSource = ds;
        grd_activity.DataBind();
        con.Close();
    }
  
    protected void grd_activity_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string VidHb = grd_activity.Rows[e.RowIndex].Cells[6].Text.ToString();
        Response.Redirect("Activity.aspx?pid=" + VidHb + "");
    }
    protected void grd_activity_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowState != DataControlRowState.Edit) // check for RowState
        {
            if (e.Row.RowType == DataControlRowType.DataRow) //check for RowType
            {
                e.Row.Cells[4].ToolTip = "Click For Edit Data";
                string id = e.Row.Cells[6].Text; // Get the id to be deleted
                ImageButton lb = (ImageButton)e.Row.Cells[5].FindControl("LinkDelete");  //access the LinkButton from the TemplateField using FindControl method
                if (lb != null)
                {
                    lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");  //attach the JavaScript function
                }
            }
        }
    }
    protected void grd_activity_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        string DlObj = grd_activity.Rows[e.RowIndex].Cells[6].Text.ToString();
        con.Open();
        cmd = new SqlCommand("delete from tbl_Activity where Id=" + DlObj + "", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Record Deleted Successfully!');", true);
        Showdata();
    }
    protected void grd_activity_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd_activity.PageIndex = e.NewPageIndex;
        Showdata();
    }
    protected void lnb_newactivity_Click(object sender, EventArgs e)
    {
        Response.Redirect("Activity.aspx");
    }
}