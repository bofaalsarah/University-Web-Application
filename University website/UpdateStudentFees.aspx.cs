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
        
        SqlCommand cmdSearch;

        cmdSearch = new SqlCommand("select Student.firstname, Student.lastname, Fees.total, Fees.paid, Fees.outstanding from Fees, Student  where studentId = (select id from Student where username ='" + username.Text + "')", con);
        SqlDataAdapter da = new SqlDataAdapter(cmdSearch);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Sorry no records found with the entered keyword ...');document.location.href='UpdateStudentFees.aspx';", true);

            }
        else
            {
            firstname.Text = dt.Rows[0][0].ToString();
            lastname.Text = dt.Rows[0][1].ToString();
            total.Text = dt.Rows[0][2].ToString();
            paid.Text = dt.Rows[0][3].ToString();
            outstanding.Text = dt.Rows[0][4].ToString();
            
            }
    }

    protected void Button2_Click(object sender, EventArgs e)
     {
        con.Open();
        string query;
        int x = 0;        
        int paiD = Convert.ToInt32 (paid.Text);
        int outstand = Convert.ToInt32(outstanding.Text);
        int tota = Convert.ToInt32(total.Text);
        if (topay.Text.Trim().Length == 0)
            return;
        int toPay = Convert.ToInt32(topay.Text);
        outstanding.Text = (outstand - toPay ).ToString();
        paid.Text = (paiD + toPay).ToString();
        if (toPay > outstand)
        {
            outstanding.Text = "0";
        }

        query = "update Fees set total = '" + total.Text + "',outstanding = '" + outstanding.Text + "', paid = '" + paid.Text + "' where studentId = (select id from Student where username = '" + username.Text + "')";      
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        x= 1;
        con.Close();
        if (x == 1)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "RunCode", "javascript:alert('Student Fees Updated Successfully...');document.location.href='UpdateStudentFees.aspx';", true);

        }
    }

    
}