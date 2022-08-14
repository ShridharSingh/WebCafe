using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton4.Visible = true; //login button
                    LinkButton9.Visible = true; //menu
                    LinkButton3.Visible = true; //cart


                    LinkButton2.Visible = false; //your profile
                    LinkButton1.Visible = false; //logout button
                    LinkButton5.Visible = false; //Hi user
                    LinkButton8.Visible = false; //reports
                    LinkButton11.Visible = false; //admin page
                }
                else if (Session["role"].Equals("employee"))
                {
                    LinkButton1.Visible = true; //logout button
                    LinkButton9.Visible = true; //menu
                    LinkButton3.Visible = true; //cart                    
                    LinkButton2.Visible = true; //your profile
                    
                    LinkButton5.Visible = true; //Hi user
                    LinkButton5.Text = "Hi "+Session["name"].ToString();

                    LinkButton4.Visible = false; //login button
                    LinkButton8.Visible = false; //reports
                    LinkButton11.Visible = false; //admin page
                }
                else if (Session["role"].Equals("manager"))
                {
                    LinkButton1.Visible = true; //logout button
                    LinkButton5.Visible = true; //Hi user
                    LinkButton5.Text = "Hi Manager";
                    LinkButton8.Visible = true; //reports
                    LinkButton11.Visible = true; //admin page
                   

                    LinkButton9.Visible = true; //menu
                    LinkButton3.Visible = true; //cart   
                    LinkButton2.Visible = false; //your profile                                 
                    LinkButton4.Visible = false; //login button
                    
                }


            }

            
            catch (Exception ex)
            {

            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("about.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeeprofile.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("contactus.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("help.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("reports.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("menu.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["username"] = "";
            Session["status"] = "";
            LinkButton4.Visible = true; //login button
            LinkButton9.Visible = true; //menu
            LinkButton3.Visible = true; //cart


            LinkButton2.Visible = false; //your profile
            LinkButton1.Visible = false; //logout button
            LinkButton5.Visible = false; //Hi user
            LinkButton8.Visible = false; //reports
            LinkButton11.Visible = false; //admin page

            Response.Redirect("home.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageitem.aspx");
        }
    }
}