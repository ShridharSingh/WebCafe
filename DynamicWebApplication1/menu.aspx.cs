using System;
using System.Collections;
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
    public partial class Menu : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        int selectedIndex = 0, price = 0, quantity = 0, threshold = 0; 
        string category, name, description, availability, archived, imagelink;
        ArrayList activeWorker = new ArrayList();

        int orderno;


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){ 


            }

            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
         
            try
            {
                if (Session["role"].Equals("employee"))
                {
                    //TextBox5.Visible = true;
                    //TextBox8.Visible = true;
                    //Label2.Visible = true;
                    //Label3.Visible = true;
                    //TextBox5.Text = Session["crbal"].ToString();
                    //TextBox8.Text = Session["crbal"].ToString();         
                }
            }
            catch (Exception ex) {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

       

        protected void Button4_Click(object sender, EventArgs e)
        {
           //Select from dropdownlist
            SqlDataSource2.SelectCommand = "select * from S_Item where Item_Category='"+DropDownList1.SelectedValue+ "' and Item_AvailabilityStatus='Available'";
            //Response.Write("<script> alert ('"+ DropDownList1.SelectedValue+ "'); </script>");
            GridView1.DataBind();

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Confectionery' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Cake' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Pastry' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Frozen' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Savory' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_Category='Drink' and Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //Show All items
            SqlDataSource2.SelectCommand = "Select * from S_Item where Item_AvailabilityStatus='Available'";
            GridView1.DataBind();
            
        }



        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = 4;
        }


        protected void AddButton_Click(object sender, EventArgs e)
        {
            selectedIndex = Convert.ToInt32((sender as Button).CommandArgument);

            GridView1.DataBind();

            if (checkDuplicate())
            {
                Response.Write("<script> alert ('Cannot Add. Item already added to cart'); </script>");
            }
            else {
                selectItem();
                addToCart();
                //addToOrderItem();
            }
            

                    
        }

        public bool checkDuplicate() {


            String sql = "select * from CART where Item_ID = '" + selectedIndex.ToString() + "'";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.HasRows)
                    {
                       
                        return true;
                    }
                }
                else {
                    return false;

                }
            }return true;
        }


        public void selectItem()
        {

            String sql = "select * from S_Item where Item_ID = '" + selectedIndex.ToString() + "'";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read())
                    {                        
                        name = dr.GetValue(2).ToString(); //Item Name
                        category = dr.GetValue(1).ToString(); //Item Category
                        description = dr.GetValue(3).ToString(); //Item Description
                        
                        price = dr.GetInt32(4); //Item Cost
                        quantity = dr.GetInt32(5); //Item Quantity
                        threshold = dr.GetInt32(6); //Item Threshold

                        availability = dr.GetValue(7).ToString(); //Item Avaiblability
                        archived = dr.GetValue(8).ToString(); //Item Archived
                        imagelink = dr.GetValue(10).ToString(); //Image Link

                    }
                }

                Response.Write("<script> alert ('"+name+" has been added to cart'); </script>");
            }
        }




        public void addToCart()
        {

            String sql = "insert into CART (Item_ID, Item_Category, Item_Name, Item_Description, Item_Price, Selected_Item_Quantity, Item_Quantity, "+
                "Subtotal, Item_Image_Link) values (@Item_ID, @Item_Category, @Item_Name, @Item_Description, @Item_Price, @Selected_Item_Quantity, "+
                "@Item_Quantity, @Subtotal, @Item_Image_Link)";
            //String sql = "insert into CART (Item_ID, Item_Category, Item_Name, Item_Description, Item_Price, Item_Quantity, Item_Threshold, Item_AvailabilityStatus, Item_Archived, Item_Image_Link) values (@Item_ID, @Item_Category, @Item_Name, @Item_Description, @Item_Price, @Item_Quantity, @Item_Threshold, @Item_AvailabilityStatus, @Item_Archived, @Item_Image_Link)";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                //string name = "Select Item_Name from S_Item where Item_ID='" + selectedIndex + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                //session variable coz we wont know which employee ordered what if they dont log in before they add items to the cart
                //string empid = Session["empid"].ToString();
                cmd.Parameters.AddWithValue("@Item_ID", selectedIndex);
                //cmd.Parameters.AddWithValue("@Emp_ID", Session["empid"]);



                cmd.Parameters.AddWithValue("@Item_Category", category);
                cmd.Parameters.AddWithValue("@Item_Name", name);
                cmd.Parameters.AddWithValue("@Item_Description", description);
                cmd.Parameters.AddWithValue("@Item_Price", price);
                cmd.Parameters.AddWithValue("@Selected_Item_Quantity", 1);
                cmd.Parameters.AddWithValue("@Item_Quantity", quantity);
                cmd.Parameters.AddWithValue("@Subtotal", price);
                cmd.Parameters.AddWithValue("@Item_Image_Link", imagelink);


                cmd.ExecuteNonQuery();

            }
        }


      

    }
}