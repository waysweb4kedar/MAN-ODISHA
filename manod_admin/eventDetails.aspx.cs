using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manod_admin_eventDetails : System.Web.UI.Page
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
                loadtransactionno();
                if (Request.QueryString["pid"] != null && Request.QueryString["pid"].ToString() != "")
                {
                    string photodata = Request.QueryString["pid"].ToString();
                    loadPhotoData(photodata);
                }
            }
            catch
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    public void loadPhotoData(string photodata)
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        try
        {
            Lbn_Submit.Text = "Update";
            Lbn_Submit.ToolTip = "Click Here For Update";
            da = new SqlDataAdapter("select Id,eventId,eventname,eventimgg,EnterBy  from tbl_event where Id='" + photodata + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows[0][0].ToString() != "")
            {
                hdn_id.Value = photodata;
                txt_eventname.Text = dt.Rows[0]["eventname"].ToString();
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

    private string loadtransactionno()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();

        string vtransno = "";
        string vid = "";

        con.Open();
        SqlCommand cmd = new SqlCommand("Select max(id)+1 as cnt from tbl_event", con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            vid = rd["cnt"].ToString();
        }
        rd.Close();
        con.Close();

        Random rnd = new Random();
        int x = rnd.Next(0, 99);

        if (vid.Length < 1)
        {
            vtransno = "MOS" + x + "000" + vid;
        }
        else if (vid.Length > 1)
        {
            vtransno = "MOS" + x + "00" + vid;
        }
        else if (vid.Length > 2)
        {
            vtransno = "MOS" + x + "0" + vid;
        }
        else if (vid.Length > 3)
        {
            vtransno = "MOS" + x + "" + vid;
        }
        else if (vid.Length == 1)
        {
            vtransno = "MOS" + x + "000" + vid;
        }
        return vtransno;
    }

    protected void Lbn_Submit_Click(object sender, EventArgs e)
    {
        DataClassesDataContext mdmo = new DataClassesDataContext(conmanodisha.Getsqlmanodisha());

        if (txt_eventname.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Event Name is required !');", true);
            txt_eventname.Focus();
            return;
        }

        hdn_Autoid.Value = loadtransactionno();
        string ImgShw = "";
        if (hdn_id.Value == "")
        {
            if (flu_filepdf.HasFile)
            {
                flu_filepdf.PostedFile.SaveAs(Server.MapPath("~/manod_admin/AdminImg/" + flu_filepdf.FileName));
                ImgShw = "AdminImg/" + flu_filepdf.FileName.ToString();
            }

            mdmo.USP_aed_event(1, 1, hdn_Autoid.Value,txt_eventname.Text,ImgShw, "Admin");
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Content Added Successfully!');", true);
            reset();

        }
        else
        {
            if (flu_filepdf.HasFile)
            {
                flu_filepdf.PostedFile.SaveAs(Server.MapPath("~/manod_admin/AdminImg/" + flu_filepdf.FileName));
                ImgShw = "AdminImg/" + flu_filepdf.FileName.ToString();
            }
            else
            {
                SqlConnection con = conmanodisha.Getsqlmanodisha();
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                try
                {
                    string id1 = hdn_id.Value;
                    SqlDataAdapter adp = new SqlDataAdapter("select eventimgg from tbl_event where Id='" + id1 + "'", con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    ImgShw = dt.Rows[0]["eventimgg"].ToString();
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
            mdmo.USP_aed_event(4, int.Parse(hdn_id.Value), "", txt_eventname.Text, ImgShw, "Admin");

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Content Updated Successfully!');window.location.href='eventList.aspx';", true);
            reset();
        }
    }
    protected void Lnk_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("eventList.aspx");
    }
    public void reset()
    {
        txt_eventname.Text = "";
   
    }
}