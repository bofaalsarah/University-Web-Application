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
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string query = "";
            int index = DropDownList1.SelectedIndex;
            if(index == 0)
                query = "select count(*) from Teacher where username ='" + username.Text + "'";
            else
                query = "select count(*) from Student where username ='" + username.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            if (check > 0)
            {
                if (index == 0)
                    Response.Redirect("AddUser.aspx?error=2");
                else
                    Response.Redirect("AddUser.aspx?error=2");
            }
            else
            {
                Stream fs = FileUpload1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string query1 = "";
                if(index == 0)
                    query1 = "insert into Teacher (username, password, firstname, lastname, passportno, country, email, contactno, image) values (@username, @password, @firstname, @lastname, @passportno, @country, @email, @contactno, @image)";
                else
                    query1 = "insert into Student (username, password, firstname, lastname, passportno, country, email, contactno, image) values (@username, @password, @firstname, @lastname, @passportno, @country, @email, @contactno, @image)";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@username", username.Text);
                cmd1.Parameters.AddWithValue("@password", passportno.Text);
                cmd1.Parameters.AddWithValue("@firstname", firstname.Text);
                cmd1.Parameters.AddWithValue("@lastname", lastname.Text);
                cmd1.Parameters.AddWithValue("@passportno", passportno.Text);
                cmd1.Parameters.AddWithValue("@country", country.Text);
                cmd1.Parameters.AddWithValue("@email", email.Text);
                cmd1.Parameters.AddWithValue("@contactno", contactno.Text);
                cmd1.Parameters.AddWithValue("@image", bytes);
                cmd1.ExecuteNonQuery();
                if (index == 0)
                    Response.Redirect("AddUser.aspx?success=1");
                else
                {
                    SqlCommand cmd2 = new SqlCommand("select MAX(id) from Student", con);
                    int id = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
                    cmd2 = new SqlCommand("insert into Fees (studentId) values (" + id + ")", con);
                    cmd2.ExecuteNonQuery();
                    Response.Redirect("AddUser.aspx?success=2");
                }  
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.ToString());
        }

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
}