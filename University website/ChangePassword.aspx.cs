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

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        name.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        no.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        email.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        if (Session["type"].Equals("1") || Session["type"].Equals("2"))
            Image1.ImageUrl = "ImageHandler.ashx?id=" + Session["id"] + "&type=" + Session["type"];
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Session where adminId = " + Session["id"], con);
        cmd.ExecuteNonQuery();
        Session["sessionKey"] = null;
        Response.Redirect("Default.aspx");
        con.Close();
    }

    protected void checkSession()
    {
        if (Session["sessionKey"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string query = "";
        string sessionType = (string)Session["type"];
        if (sessionType.Equals("1"))
            query = "update Teacher set password = @password where id = @id";
        if (sessionType.Equals("2"))
            query = "update Student set password = @password where id = @id";
        if (sessionType.Equals("3"))
            query = "update Admin set password = @password where id = @id";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@id", Session["id"]);
        cmd.Parameters.AddWithValue("@password", password.Text);
        cmd.ExecuteNonQuery();
        con.Close();

        if (sessionType.Equals("1"))
            Response.Redirect("Teacher.aspx?success=4");
        if (sessionType.Equals("2"))
            Response.Redirect("Student.aspx?success=1");
        if (sessionType.Equals("3"))
            Response.Redirect("Admin.aspx?success=4");
    }
}