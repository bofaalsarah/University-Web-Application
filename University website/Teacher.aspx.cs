using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher : System.Web.UI.Page
{
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
            checkSession();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select teacherId from Session where sessionKey = " + Session["sessionKey"], con);
            id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            SqlDataAdapter da = new SqlDataAdapter("select firstName, lastName, contactNo, email, id from Teacher where id = " + id, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            teachername.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + dt.Rows[0][0].ToString() + "&nbsp;" + dt.Rows[0][1].ToString();
            Session["name"] = dt.Rows[0][0].ToString() + "&nbsp;" + dt.Rows[0][1].ToString();
            teacherno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + dt.Rows[0][2].ToString();
            Session["contactno"] = dt.Rows[0][2].ToString();
            teacheremail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + dt.Rows[0][3].ToString();
            Session["email"] = dt.Rows[0][3].ToString();
            Session["id"] = dt.Rows[0][4].ToString();
            Image1.ImageUrl = "ImageHandler.ashx?id=" + dt.Rows[0][4].ToString() + "&type=1";
            con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Session where teacherId = " + id, con);
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
}