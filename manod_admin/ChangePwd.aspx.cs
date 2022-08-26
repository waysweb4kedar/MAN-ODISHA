using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manod_admin_ChangePwd : System.Web.UI.Page
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

        }
    }
    protected void Lbn_Submit_Click(object sender, EventArgs e)
    {
        if (txt_CurPwd.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Current password should not be blank');", true);
            txt_CurPwd.Focus();
            return;
        }

        if (txt_NewPwd.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('New password should not be blank');", true);
            txt_NewPwd.Focus();
            return;
        }

        if (txt_ConfPwd.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Confirm password should not be blank');", true);
            txt_ConfPwd.Focus();
            return;
        }

        if (txt_ConfPwd.Text != txt_NewPwd.Text)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Password should be match');", true);
            txt_ConfPwd.Focus();
            return;
        }

        SqlConnection con = conmanodisha.Getsqlmanodisha();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        try
        {
            da = new SqlDataAdapter("select Pwd from tbl_adminuser where Name='" + Session["adminName"].ToString() + "' ", con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (txt_CurPwd.Text == ds.Tables[0].Rows[0].ItemArray[0].ToString())
                {
                    cmd = new SqlCommand("update tbl_adminuser set Pwd='" + txt_NewPwd.Text + "' where Name='" + Session["adminName"].ToString() + "'", con);
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('your password updated successfully');", true);

                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid Password');", true);
                }
            }
        }
        catch
        { }
        finally
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
  
    protected void Lnk_Reset_Click(object sender, EventArgs e)
    {
        reset();
    }

    public void reset()
    {
        txt_ConfPwd.Text = "";
        txt_CurPwd.Text = "";
        txt_NewPwd.Text = "";
    }
}