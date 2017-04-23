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


public partial class AddUser : System.Web.UI.Page    
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        adminname.Text = "NAME:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];
        adminno.Text = "CONTACT NUMBER:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["contactno"];
        adminemail.Text = "EMAIL:&nbsp;&nbsp;&nbsp;&nbsp;" + Session["name"];

       
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
 

    protected void Button4_Click(object sender, EventArgs e)
    {
        int index = DropDownList1.SelectedIndex;
        SqlCommand cmdSearch;
        if (index == 0)
        {
            cmdSearch = new SqlCommand("select * from Teacher where username ='" + username.Text + "'", con);
        }
        else
        {
            cmdSearch = new SqlCommand("select * from Student where username ='" + username.Text + "'", con);
        }
        SqlDataAdapter da = new SqlDataAdapter(cmdSearch);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Sorry no records found with the entered keyword ...');document.location.href='ManageUserInfo.aspx';", true);

            }
        else
            {
            firstname.Text = dt.Rows[0][3].ToString();
            lastname.Text = dt.Rows[0][4].ToString();
            passportno.Text = dt.Rows[0][5].ToString();
            country.Text = dt.Rows[0][6].ToString();
            email.Text = dt.Rows[0][7].ToString();
            contactno.Text = dt.Rows[0][8].ToString();
            }
    }

    protected void Button2_Click(object sender, EventArgs e)
     {
        con.Open();
        string query;
        int index = DropDownList1.SelectedIndex;
        int x = 0;

        if (index == 0)
        {
            query = "update Teacher set firstName ='" + firstname.Text + "',lastName='" + lastname.Text + "', passportNo ='" + passportno.Text + "', email='" + email.Text + "' , contactNo='" + contactno.Text + "' where username = '" + username.Text + "'";
        }
        else
        {
            query = "update Student set firstName ='" + firstname.Text + "',lastName='" + lastname.Text + "', email='" + email.Text + "' , contactNo='" + contactno.Text + "'where username = '" + username.Text + "'";
        }
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        x++;
        if (index == 0)
        {
            if (x > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Teacher's details updated successfully.');document.location.href='ManageUserInfo.aspx';", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Student's details updated successfully.');document.location.href='ManageUserInfo.aspx';", true);
        }
        con.Close();

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        con.Open();
        string query;
        int index = DropDownList1.SelectedIndex;
        int x = 0;
        if (index == 0)
        {
            query = "update Course set teacherId = '3' where teacherId = (select id from Teacher where username ='" + username.Text + "'); delete from Teacher_Attendance where teacherId = (select id from Teacher where username = '" + username.Text + "'); delete from Teacher where username = '" + username.Text + "'";
        }
        else
        {
            query = "delete from Student_Attendance where studentId = (select id from Student where username = '" + username.Text + "'); delete from Student_Course where studentId = (select id from Student where username = '" + username.Text + "');  delete from Fees where studentId = (select id from Student where username = '" + username.Text + "');  delete from Result where studentId = (select id from Student where username = '" + username.Text + "'); delete from Student where username = '" + username.Text + "'";
        }
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        x++;
        if (index == 0)
        {
            if (x > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Teacher deleted successfully.');document.location.href='ManageUserInfo.aspx';", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Student deleted successfully.');document.location.href='ManageUserInfo.aspx';", true);
        }
        con.Close();
    }
}