<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;

public class ImageHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string constr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string imgID = context.Request.QueryString["id"].ToString();
        string type = context.Request.QueryString["type"].ToString();
        System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(constr);
        System.Data.SqlClient.SqlCommand cmd;
        if (type == "1") {
            cmd = new System.Data.SqlClient.SqlCommand("Select image from Teacher where id =" + imgID, conn);
        }
        else if (type == "2")
        {
            cmd = new System.Data.SqlClient.SqlCommand("Select image from Student where id =" + imgID, conn);
        }
        else
        {
            cmd = new System.Data.SqlClient.SqlCommand("Select image from Admin where id =" + imgID, conn);
        }
        
        conn.Open();
        System.Data.SqlClient.SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((byte[])dr["image"]);
        dr.Close();
        conn.Close();

    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}