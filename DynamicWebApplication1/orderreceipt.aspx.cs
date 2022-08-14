using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicWebApplication1
{
    public partial class orderreceipt : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

        ArrayList OrderNo = new ArrayList();
        int orderno = 2;


        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Write("<script> alert ('Order has been processed. You will be redireced to view your Order receipt'); </script>");
            getOrderNo();
         
               
        }

        public void getOrderNo() {
            String sql = "Select Order_No from S_Order";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                try
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        //int i = 0;
                        //int index = 0;
                        int orderno = 2;
                        while (dr.Read())
                        {
                            //i = 0;
                            //OrderNo.Add(dr.GetValue(i));
                            //i++;
                            orderno++;


                        }


                        //index = OrderNo.Count;
                        //Label1.Text = OrderNo[index].ToString();
                        //Response.Write(OrderNo[index]);
                        Label1.Text = orderno.ToString();



                    }
                }
                catch (Exception ex)
                {
                }

            }
        }
    }
}