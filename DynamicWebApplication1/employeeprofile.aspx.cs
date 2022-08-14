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
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {            
               try{
                   if (Session["role"].Equals("employee"))
                   {
                       TextBox1.Text = Session["name"].ToString();
                       TextBox2.Text = Session["surname"].ToString();
                       TextBox3.Text = Session["email"].ToString();
                       TextBox4.Text = Session["phone"].ToString();
                       TextBox6.Text = Session["crlim"].ToString();
                       TextBox7.Text = Session["crbal"].ToString();
                       TextBox5.Text = Session["empid"].ToString();
                       TextBox8.Text = Session["password"].ToString();

                       updateCreditStanding();

                       SqlDataSource4.SelectCommand = "Select * from S_Order where Emp_ID='"+TextBox5.Text+"'";
                       GridView1.DataBind();
         
                   }
               }

               catch (Exception ex)
               {
                   Response.Write("<script> alert('Unexpectred Error: Login failed. Page inaccessile');</script>");
               }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
     
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //reset password button
            Label5.Visible = true;
            Label3.Visible = true;
            TextBox9.Visible = true;
            Button3.Visible = true;
            Label4.Visible = true;
            TextBox10.Visible = true;
            Button4.Visible = true;
            ImageButton3.Visible = true;
            ImageButton5.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //cancel button
            Label5.Visible = true;
            Label3.Visible = false;
            TextBox9.Visible = false;
            Button3.Visible = false;
            Label4.Visible = false;
            TextBox10.Visible = false;
            Button4.Visible = false;
            ImageButton3.Visible = false;
            ImageButton5.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (TextBox9.Text == TextBox10.Text && TextBox9.Text != "")
            {
                //Update Password method to be added

                updatePassword();
                getPassowrd();
                Session["password"] = TextBox8.Text;
                Response.Write("<script> alert('Your Password has been successfully updated!');</script>");
            }
            else
            {
                Response.Write("<script> alert('Invalid Password: Passwords do not match');</script>");
            }
        }



        //Image Buttons need work - Not Urgent - They do not restore the original text inputted  due to the password restriction
        protected void ImageButton1_Click(object sender, EventArgs e)
        {
            TextBox8.TextMode=TextBoxMode.SingleLine;
            ImageButton1.Visible = false;
            ImageButton2.Visible = true;
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            TextBox8.TextMode = TextBoxMode.Password;
            ImageButton1.Visible = true;
            ImageButton2.Visible = false;
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            
          
            TextBox11.Text = TextBox9.Text;
            TextBox11.Visible = true;
            TextBox9.Visible = false;
            ImageButton3.Visible = false;
            ImageButton4.Visible = true;

        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            TextBox9.Text = TextBox11.Text;
            TextBox11.Visible = false;
            TextBox9.Visible = true;
            ImageButton3.Visible = true;
            ImageButton4.Visible = false;
        }


        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            TextBox12.Text = TextBox10.Text;
            TextBox12.Visible = true;
            TextBox9.Visible = false;
            ImageButton3.Visible = false;
            ImageButton4.Visible = true;

        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            TextBox12.Text = TextBox10.Text;
            TextBox11.Visible = false;
            TextBox9.Visible = true;
            ImageButton3.Visible = true;
            ImageButton4.Visible = false;
        }



        //GridView Search Buttons
        protected void Button11_Click(object sender, EventArgs e)
        {
            //All
            SqlDataSource4.SelectCommand = "Select * from S_Order where Emp_ID='" + TextBox5.Text.Trim() + "'";
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Collected
            SqlDataSource4.SelectCommand = "Select * from S_Order where Order_Status='Picked Up' AND Emp_ID='" + TextBox5.Text.Trim() + "'";
            GridView1.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Ready
            SqlDataSource4.SelectCommand = "Select * from S_Order where Order_Status='Ready' AND Emp_ID='" + TextBox5.Text.Trim() + "'";
            GridView1.DataBind();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //Placed/ in-progress
            SqlDataSource4.SelectCommand = "Select * from S_Order where Order_Status='Placed' AND Emp_ID='" + TextBox5.Text.Trim() + "'";
            GridView1.DataBind();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //Unfulfilled
            SqlDataSource4.SelectCommand = "Select * from S_Order where Order_Status='' AND Emp_ID='" + TextBox5.Text.Trim() + "'";
            GridView1.DataBind();
        }




        //methods

        public void getPassowrd()
        {

            String sql = "select distinct * from S_Employee where Emp_Email='" + TextBox3.Text.Trim() + "'";
            //SqlDataSource6.SelectCommand = "Select * from S_Employee where Emp_ID='" + TextBox5.Text + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read())
                    {
                        TextBox8.Text = dr.GetValue(1).ToString();
                        
                    }
                }
            }
        }

        public void updatePassword()
        {
            String sql = "UPDATE S_Employee set Emp_Password='"+TextBox10.Text.Trim()+"' where Emp_Email='" + TextBox3.Text.Trim() + "'";
            //SqlDataSource6.SelectCommand = "Select * from S_Employee where Emp_ID='" + TextBox5.Text + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();            
            }
        }

        public void updateCreditStanding()
        {

            if (Int32.Parse(TextBox7.Text) < 0)
            {
                Label1.Text = "Bad";
                Label1.CssClass = "badge rounded-pill bg-danger";

            }
            else {
                Label1.Text = "Good";
                Label1.CssClass = "badge rounded-pill bg-success";
            }
        }
    }
}