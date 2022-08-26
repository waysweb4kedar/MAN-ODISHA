using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class manod_admin_GalleryDetails : System.Web.UI.Page
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
            da = new SqlDataAdapter("select Id,galeryId,galeryDescp,galeryImgg,EnterBy  from tbl_gallery where Id='" + photodata + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows[0][0].ToString() != "")
            {
                hdn_id.Value = photodata;
                edtr_descp.Content = dt.Rows[0]["galeryDescp"].ToString();
                if (dt.Rows[0]["galeryImgg"].ToString() != "")
                {
                    imgLogo.ImageUrl = "~/manod_admin/AdminImg/" + dt.Rows[0]["galeryImgg"].ToString();
                    hdn_img.Value = dt.Rows[0]["galeryImgg"].ToString();
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


    private string loadtransactionno()
    {
        SqlConnection con = conmanodisha.Getsqlmanodisha();

        string vtransno = "";
        string vid = "";

        con.Open();
        SqlCommand cmd = new SqlCommand("Select max(id)+1 as cnt from tbl_gallery", con);
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

        if (edtr_descp.Content == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Description is required !');", true);
            edtr_descp.Focus();
            return;
        }

        hdn_Autoid.Value = loadtransactionno();
        string ImgShw = "";
        if (hdn_id.Value == "")
        {
            if (flu_photoImg.HasFile)
            {
                flu_photoImg.PostedFile.SaveAs(Server.MapPath("~/AdminImg/" + flu_photoImg.FileName));
                ImgShw = "AdminImg/" + flu_photoImg.FileName.ToString();
            }

            mdmo.USP_aed_Gallery(1, 1, hdn_Autoid.Value, edtr_descp.Content, hdn_img.Value, "Admin");
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Content Added Successfully!');", true);
            reset();

        }
        else
        {
            if (flu_photoImg.HasFile)
            {
                flu_photoImg.PostedFile.SaveAs(Server.MapPath("~/manod_admin/AdminImg/" + flu_photoImg.FileName));
                ImgShw = "AdminImg/" + flu_photoImg.FileName.ToString();
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
                    SqlDataAdapter adp = new SqlDataAdapter("select galeryImgg from tbl_gallery where Id='" + id1 + "'", con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    ImgShw = dt.Rows[0]["galeryImgg"].ToString();
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
            mdmo.USP_aed_Gallery(4, int.Parse(hdn_id.Value), "", edtr_descp.Content, hdn_img.Value, "Admin");

            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Content Updated Successfully!');window.location.href='galleryList.aspx';", true);
            reset();
        }
    }

    protected void Lnk_Cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("galleryList.aspx");
    }

    public void reset()
    {
        edtr_descp.Content = "";
        imgLogo.ImageUrl = "";
        hdn_img.Value = "";
    }

    protected void lkbUpload_Click(object sender, EventArgs e)
    {
        if (flu_photoImg.HasFile)
        {
            string[] allowed_extensions = { "jpg", "JPG", "png", "gif" };
            string[] file_extension = flu_photoImg.PostedFile.FileName.Split('.');
            string Result = "0";
            for (var i = 0; i <= allowed_extensions.Length - 1; i++)
            {
                if (allowed_extensions[i].ToString() == file_extension[1].ToString())
                {
                    Result = "1";
                }
            }
            if (Result.Equals("1"))
            {
                string FileName = DateTime.Now.ToString("ddMMyyyyhhmmss") + "." + file_extension[1].ToString();
                string Pathh = "~/manod_admin/AdminImg/" + FileName;
                flu_photoImg.SaveAs(HttpContext.Current.Server.MapPath(Pathh));
                imgLogo.Visible = true;
                imgLogo.ImageUrl = Pathh;
                hdn_img.Value = FileName;
                // divimg.Visible = true;
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Invalid File Please Choose jpg, png or  gif File   !');", true);
                imgLogo.ImageUrl = "";
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Browse  a Big File !');", true);
        }
    }
}