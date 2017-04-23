using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        studentname.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        studentno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        studentemail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        Image1.ImageUrl = "ImageHandler.ashx?id=" + Session["id"] + "&type=2";
        SqlDataSource1.SelectParameters["sid"].DefaultValue = (string)Session["id"];
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
}