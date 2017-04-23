using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["sessionKey"] != null)
        {
            if (Session["type"].Equals("1"))
                Response.Redirect("Teacher.aspx");
            if (Session["type"].Equals("2"))
                Response.Redirect("Student.aspx");
            if (Session["type"].Equals("3"))
                Response.Redirect("Admin.aspx");
        }
    }

    protected int generateSessionKey()
    {
        Random rnd = new Random();
        return rnd.Next(1000, 100000);
    }

    protected void Button1_Click(object sender, EventArgs e)
 {
     SqlConnection con = new
    SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
     con.Open();
     if (userType.SelectedIndex == 0)
     {
         SqlCommand cmd = new SqlCommand("select count(*) from Teacher where username = '"
        + username.Text + "' and password = '" + password.Text + "'", con);
         int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

         if (count > 0)
         {
             SqlCommand cmd2 = new SqlCommand("select id from Teacher where username = '" + username.Text + "'", con);
             int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
             int sessionKey = generateSessionKey();
             SqlCommand cmd3 = new SqlCommand("insert into Session (teacherId, sessionKey) values (" + id + ", " + sessionKey + ")", con);
             cmd3.ExecuteNonQuery();
             Session["sessionKey"] = sessionKey;
             Session["type"] = "1";
             Response.Redirect("Teacher.aspx");
         }
         else
         {
             Response.Redirect("Default.aspx?error=1");
         }
 }
 if (userType.SelectedIndex == 1)
 {
     SqlCommand cmd = new SqlCommand("select count(*) from Student where username = '"
    + username.Text + "' and password = '" + password.Text + "'", con);
     int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

     if (count > 0)
     {
         SqlCommand cmd2 = new SqlCommand("select id from Student where username = '" + username.Text + "'", con);
         int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
         int sessionKey = generateSessionKey();
         SqlCommand cmd3 = new SqlCommand("insert into Session (studentId, sessionKey) values (" + id + ", " + sessionKey + ")", con);
         cmd3.ExecuteNonQuery();
         Session["sessionKey"] = sessionKey;
         Session["type"] = "2";
         Response.Redirect("Student.aspx");
     }
     else
     {
         Response.Redirect("Default.aspx?error=1");
     }
 }
 if (userType.SelectedIndex == 2)
 {
     SqlCommand cmd = new SqlCommand("select count(*) from Admin where username = '"
    + username.Text + "' and password = '" + password.Text + "'", con);
     int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

     if (count > 0)
     {
         SqlCommand cmd2 = new SqlCommand("select id from Admin where username = '" + username.Text + "'", con);
         int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
         int sessionKey = generateSessionKey();
         SqlCommand cmd3 = new SqlCommand("insert into Session (adminId, sessionKey) values (" + id + ", " + sessionKey + ")", con);
         cmd3.ExecuteNonQuery();
         Session["sessionKey"] = sessionKey;
         Session["type"] = "3";
         Response.Redirect("Admin.aspx");
     }
     else
     {
         Response.Redirect("Default.aspx?error=1");
     }
 }
 con.Close();
 }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if ((resetstudent.Text.Length == 0 && resetteacher.Text.Length == 0) || resetstudent.Text.Length > 0 && resetteacher.Text.Length > 0)
        {
            Response.Redirect("Default.aspx?error=2");
        }
        else {
            SqlConnection con = new
            SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            if(resetstudent.Text.Length > 0){
                SqlCommand cmd = new SqlCommand("update Student set password = (select passportNo from Student where username = '" + resetstudent.Text + "') where username = '" + resetstudent.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx?reset=1");
            }
            if (resetteacher.Text.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("update Teacher set password = (select passportNo from Teacher where username = '" + resetteacher.Text + "') where username = '" + resetteacher.Text + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Default.aspx?reset=1");
            }
        }
    }
}