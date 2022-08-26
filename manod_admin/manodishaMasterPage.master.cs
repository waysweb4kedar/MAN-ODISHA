using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manod_admin_manodishaMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                lblUName.Text = Session["adminName"].ToString();
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
    protected void lnkBtn_logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
