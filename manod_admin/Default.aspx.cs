using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manod_admin_Default : System.Web.UI.Page
{
    sqlmanodisha conmanodisha = new sqlmanodisha();
    SqlCommand cmd;
    SqlDataReader rd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string vtag = Request.QueryString["vtag"];
            if (vtag == "Out")
            {
                //lbl_msg.Visible = true;
                //lbl_msg.Text = "Login Session Time out, Please Login again";
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Login Session Time out, Please Login again');", true);
            }

            Session.Clear();
            Session.Abandon();
            Session["uid"] = "";
            Session["adminName"] = "";
            this.Response.Cookies.Remove("abc");
            this.Session.RemoveAll();
        }
    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        DataClassesDataContext mdmo = new DataClassesDataContext(conmanodisha.Getsqlmanodisha());

        var chk = from res in mdmo.tbl_adminusers
                  where res.Name == txtUserName.Text && res.Pwd == txtPassword.Text
                  select new
                  {
                      res.Id,
                      res.Name,
                      res.Pwd
                  };
        if (chk.Count() > 0)
        {
            Session["uid"] = chk.ToArray()[0].Id;
            Session["adminName"] = chk.ToArray()[0].Name;
            string vdate = DateTime.Now.ToString("dd-MMM-yyyy");
            string vdtime = DateTime.Now.ToString("dd-MMM-yyyy hh:mm tt");
            Response.Redirect("Home.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid Login, Try again!');", true);
        }
    }
}