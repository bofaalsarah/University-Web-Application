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

public partial class PublishGrades : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        adminname.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        adminno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        adminemail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        //DropDownList1.DataBind();
        //DropDownList1.Items.Insert(0, new ListItem("Please select a course", "init"));
        //DropDownList1.SelectedIndex = 0;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        foreach (GridViewRow row in GridView1.Rows)
        {
            string id = GridView1.Rows[row.RowIndex].Cells[0].Text;
            TextBox result = (TextBox)GridView1.Rows[row.RowIndex].FindControl("TextBox1");
            CheckBox resit = (CheckBox)GridView1.Rows[row.RowIndex].FindControl("CheckBox1");
            string query = "insert into Result values (@studentId, @courseId, @result, @isResit)";
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@studentId", id);
                cmd.Parameters.AddWithValue("@courseId", DropDownList1.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@result", result.Text);
                cmd.Parameters.AddWithValue("@isResit", resit.Checked);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
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
        else if (!Session["type"].Equals("3"))
        {
            if (Session["type"].Equals("2"))
            {
                Response.Redirect("Student.aspx");
            }
            else
            {
                Response.Redirect("Teacher.aspx");
            }
        }
    }
    protected void changeValues(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString().Equals("init"))
        {
            GridView1.Visible = false;
            Button2.Visible = false;
            return;
        }
        SqlDataSource2.SelectParameters["cid"].DefaultValue = DropDownList1.SelectedValue.ToString();
        GridView1.DataBind();
        GridView1.Visible = true;
        Button2.Visible = true;
    }
}