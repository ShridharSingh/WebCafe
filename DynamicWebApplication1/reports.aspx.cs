using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<script> alert ('Reports have been moved and are being handled by powerbi');</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script> alert ('Printing');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Write("<script> alert ('Sending via Email');</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx"); ;
        }
    }
}