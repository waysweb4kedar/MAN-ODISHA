using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class gallery : System.Web.UI.Page
{
    sqlmanodisha conmanodisha = new sqlmanodisha();
    SqlCommand cmd;
    SqlDataReader rd;
    SqlDataAdapter da;
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                loadgaleryImg();
                loadgaleryImgcount();
            }
            catch
            {
                //Response.Redirect("Default.aspx");
            }
        }
    }

    public void loadgaleryImg()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        try
        {
            var count = 0;
            var start = 0;
            var end = 0;

            if (Request.QueryString["id"] != null)
            {
                count = int.Parse(Request.QueryString["id"].ToString());
                count = count + 1;
                start = ((count - 1) * 50) + 1; // take size as u need
                end = start + 50 - 1; // take size as u need
            }
            else
            {
                start = 1;
                end = start + 50 - 1; // take size as u need
            }
            string sqlcomm = "select * from(select row_number() over(order by EnterDate desc) as row_count,* from tbl_gallery) as a where row_count between " + start + " and " + end + " order by EnterDate desc";

            SqlDataAdapter da = new SqlDataAdapter(sqlcomm, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "")
            {
                rptr_galeryImgg.DataSource = dt;
                rptr_galeryImgg.DataBind();
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


    public void loadgaleryImgcount()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        try
        {
            var count = 0.00;
            SqlDataAdapter da = new SqlDataAdapter("Select  count(*) from tbl_gallery", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows.Count > 0 && dt.Rows[0][0].ToString() != "0")
            {
                count = int.Parse(dt.Rows[0][0].ToString());
                double count1 = Math.Ceiling(count / 50); // take size as u need

                var fcount = 0;
                for (var x = 1; x <= count1; x++)
                {
                    fcount = x - 1;

                    if (count1 > 1)
                    {
                        next_page.InnerHtml = next_page.InnerHtml + "<a class='gal_num' href='gallery.aspx?id=" + fcount + "'>" + x + "</a>";
                    }
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

}