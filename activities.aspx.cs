using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class activities : System.Web.UI.Page
{
    sqlmanodisha conmanodisha = new sqlmanodisha();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                loadActivity();
            }
            catch
            {
                //Response.Redirect("Default.aspx");
            }
        }
    }

    public void loadActivity()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        try
        {
            SqlDataAdapter da = new SqlDataAdapter("Select  * from tbl_Activity order by Id asc", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "")
            {
                rptr_Activity.DataSource = dt;
                rptr_Activity.DataBind();
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
}