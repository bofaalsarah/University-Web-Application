using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TeacherEditAttendance : System.Web.UI.Page
{
    string init = "Please choose a value";
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        teachername.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        teacherno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        teacheremail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        Image1.ImageUrl = "ImageHandler.ashx?id=" + Session["id"] + "&type=1";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        if (!IsPostBack)
        {
            SqlDataAdapter da = new SqlDataAdapter("select name, id from Course where teacherId = " + Session["id"], con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList1.Items.Add(new ListItem(init, "init"));
            DropDownList2.Items.Add(new ListItem(init, "init"));
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DropDownList1.Items.Add(new ListItem(dt.Rows[i][0].ToString(), dt.Rows[i][1].ToString()));
            }
        }
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete from Session where teacherId = " + Session["id"], con);
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

    private void BindGrid()
    {
        SqlDataSource1.SelectParameters["cid"].DefaultValue = DropDownList1.SelectedValue.ToString();
        GridView1.DataBind();
    }

    protected void changeDates(object sender, EventArgs e)
    {
        string date = DropDownList2.SelectedValue.ToString();
        if (date.Equals("init"))
        {
            GridView1.Visible = false;
            Button3.Visible = false;
        }
    }

    protected void getDates(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string courseId = DropDownList1.SelectedValue.ToString();
        if (courseId.Equals("init"))
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem(init, "init"));
            GridView1.Visible = false;
            Button3.Visible = false;
            return;
        }
        SqlDataAdapter da = new SqlDataAdapter("select distinct sessionDate from Student_Attendance where courseId = " 
            + courseId, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        DropDownList2.Items.Clear();
        DropDownList2.Items.Add(new ListItem(init, "init"));
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DropDownList2.Items.Add(new ListItem(dt.Rows[i][0].ToString(), dt.Rows[i][0].ToString()));
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue.ToString() == "init" || DropDownList1.SelectedValue.ToString() == "init")
            return;
        SqlDataSource1.SelectParameters["cid"].DefaultValue = DropDownList1.SelectedValue.ToString();
        SqlDataSource1.SelectParameters["sdate"].DefaultValue = DateTime.Parse(DropDownList2.SelectedValue.ToString()).ToString("dd-MMM-yyyy");
        GridView1.DataBind();
        GridView1.Visible = true;
        Button3.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        foreach (GridViewRow row in GridView1.Rows)
        {
            string id = GridView1.Rows[row.RowIndex].Cells[0].Text;
            CheckBox attended = (CheckBox)GridView1.Rows[row.RowIndex].FindControl("CheckBox1");
            string query = "update Student_Attendance set attended = @attended where studentId = @studentId and "
                + "courseId = @courseId and sessionDate = @sessionDate";
            using (SqlCommand cmd = new SqlCommand(query))
            {
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@studentId", id);
                cmd.Parameters.AddWithValue("@courseId", Int32.Parse(DropDownList1.SelectedValue.ToString()));
                cmd.Parameters.AddWithValue("@sessionDate", DateTime.Parse(DropDownList2.SelectedValue.ToString()).ToString("dd-MMM-yyyy"));
                cmd.Parameters.AddWithValue("@attended", attended.Checked);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        Response.Redirect("Teacher.aspx?success=2");
    }
    }