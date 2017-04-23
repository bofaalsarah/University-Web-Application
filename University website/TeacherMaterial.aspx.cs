using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherMaterial : System.Web.UI.Page
{
    string init = "Please choose a value";
    protected void Page_Load(object sender, EventArgs e)
    {
            checkSession();
            teachername.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
            teacherno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
            teacheremail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
            Image1.ImageUrl = "ImageHandler.ashx?id=" + Session["id"] + "&type=1";
            if (!IsPostBack) { 
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select name, id from Course where teacherId = " + Session["id"], con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            for(int i = 0; i < dt.Rows.Count; i++){
                DropDownList1.Items.Add(new ListItem(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
        }
            }
        BindGrid();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Session where teacherId = " + Session["id"], con);
        cmd.ExecuteNonQuery();
        Session["sessionKey"] = null;
        Response.Redirect("Default.aspx");
    }

    protected void checkSession()
    {
        if (Session["sessionKey"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else if (!Session["type"].Equals("1"))
        {
            if (Session["type"].Equals("2"))
            {
                Response.Redirect("Student.aspx");
            }
            else
            {
                Response.Redirect("Admin.aspx");
            }
        }
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
        string contentType = FileUpload1.PostedFile.ContentType;
        using (Stream fs = FileUpload1.PostedFile.InputStream)
        {
            using (BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string query = "insert into Material (courseId, fileName, fileContent, fileContentType) values (@courseId, @fileName, @fileContent, @fileContentType)";
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = con;
                        cmd.Parameters.AddWithValue("@courseId", Int32.Parse(DropDownList1.SelectedValue.ToString()));
                        cmd.Parameters.AddWithValue("@filename", filename);
                        cmd.Parameters.AddWithValue("@fileContent", bytes);
                        cmd.Parameters.AddWithValue("@fileContentType", contentType);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        Response.Redirect("Teacher.aspx?success=3");

    }

    private void BindGrid()
    {
        SqlDataSource1.SelectParameters["cid"].DefaultValue = DropDownList1.SelectedValue.ToString();
        GridView1.DataBind();
    }

    protected void changeValues(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int id = int.Parse((sender as LinkButton).CommandArgument);
        byte[] bytes;
        string fileName, contentType;
        string myConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(myConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select fileName, fileContent, fileContentType from Material where id=@Id";
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    bytes = (byte[])sdr["fileContent"];
                    contentType = sdr["fileContentType"].ToString();
                    fileName = sdr["fileName"].ToString();
                }
                con.Close();
            }
        }
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = contentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

}