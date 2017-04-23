using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentCourses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        studentname.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        studentno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        studentemail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        Image1.ImageUrl = "ImageHandler.ashx?id=" + Session["id"] + "&type=2";
        //SqlDataSource1.SelectParameters["sid"].DefaultValue = (string)Session["id"];
        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("select Course.name, Course.id from Course where id in "
                + "(select courseId from Student_Course where studentId = " + Session["id"] + ")", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DropDownList1.Items.Add(new ListItem(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
            }
        }
        BindGrid();
    }

    protected void checkSession()
    {
        if (Session["sessionKey"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else if (!Session["type"].Equals("2"))
        {
            if (Session["type"].Equals("1"))
            {
                Response.Redirect("Teacher.aspx");
            }
            else
            {
                Response.Redirect("Admin.aspx");
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Session where studentId = " + Session["id"], con);
        cmd.ExecuteNonQuery();
        Session["sessionKey"] = null;
        Response.Redirect("Default.aspx");
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