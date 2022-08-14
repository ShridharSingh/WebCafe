using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class userlogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        string role = ""; //used for checking session variables can change between manager and employee
        string status = "Good";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Back to Home button
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        //log in button
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkUser())
            {

            }
            else
            {
                Response.Write("<script> alert('Error 32: Invalid credentials. User does not exist!');</script>");
            }
        }

        public Boolean checkUser()
        {            
            //string strcon = "Server=146.230.177.46\\ist3; Database=ist3fb; User ID=ist3fb; Password=684f47";
           // string strcon = "Server=146.230.177.46\\ist3; Database=group2; User ID=group2; Password=dgg73";

            //String sql = "select * from Employee where Emp_Email='" + TextBox1.Text.Trim() + "' and Emp_Password='" + TextBox2.Text.Trim() + "'";
            String sql = "select * from S_Employee where Emp_Email='" + TextBox1.Text.Trim() + "' and Emp_Password='" + TextBox2.Text.Trim() + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    //dr.GetString(6) use for user type
                    //dr.GetString(2)  use for user name
                    
                    while (dr.Read())
                    {
                        if (dr.GetString(6) == "Manager")
                        {
                            Response.Write("<script> alert('Manager login Successful');</script>");
                            Session["role"] = "manager";
                            Response.Redirect("home.aspx");
                        }
                        if (dr.GetString(6) != "Manager")
                        {
                            Response.Write("<script> alert('Employee login Successful');</script>");
                            Session["empid"] = dr.GetInt32(0);
                            Session["password"] = dr.GetValue(1).ToString();
                            Session["name"] = dr.GetString(2);//displays employees name in nav bar greeting and employee profile
                            Session["surname"] = dr.GetString(3);//displays employees surname in employee profile
                            Session["email"] = dr.GetString(4);
                            Session["phone"] = dr.GetValue(5);
                            Session["crlim"] = dr.GetInt32(7);
                            Session["crbal"] = dr.GetInt32(8);
                            Session["status"] = status;
                            Session["role"] = "employee";
                   
                            Response.Redirect("home.aspx");//changed as the user may not always want to see their profile when logged in
                        }
                        return true;
                    }
                }
                conn.Close();
            }
            return false;
        }

    }
}
