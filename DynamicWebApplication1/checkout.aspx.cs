using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class Checkout : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("orderreceipt.aspx");
            logout();

            
        }





        public void clearCart()
        {

            String sql = "Truncate Table Cart";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
        }



        public void logout() {
            Session["role"] = "";
            Session["username"] = "";
            Session["status"] = "";
            Response.Redirect("home.aspx");
           
        }
    }
}