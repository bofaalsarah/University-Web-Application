using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentsResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        adminname.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        adminno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        adminemail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
    }

    protected void checkSession()
    {
        if (Session["sessionKey"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        else if (!Session["type"].Equals("3"))
        {
            if (Session["type"].Equals("1"))
            {
                Response.Redirect("Teacher.aspx");
            }
            else
            {
                Response.Redirect("Student.aspx");
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
    protected void changeValues(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString().Equals("init"))
        {
            GridView1.Visible = false;
            return;
        }
        SqlDataSource1.SelectParameters["cid"].DefaultValue = DropDownList1.SelectedValue.ToString();
        GridView1.DataBind();
        GridView1.Visible = true;
    }
    }