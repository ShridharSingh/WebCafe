using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class Help : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script> alert ('Thank you for your question. We look forward to answering it.');</script>");
        }
    }
}