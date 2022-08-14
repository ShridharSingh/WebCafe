using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace DynamicWebApplication1
{
    public partial class manageitem : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlDataSource4.SelectCommand = "Select * from S_Item";
            //fillCategoryValues();
            GridView1.DataBind();

     
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Select Button
            try
            {
                getItemInformation();
                getBadgeDetail();
                TextBox1.ReadOnly = true;
            }
            catch {
                Response.Write("<script> alert ('Please select a valid Item ID'); </script>");
            }                       
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //Delete Button
            try {

                delete();
                GridView1.DataBind();
                getItemInformation();
                getBadgeDetail();
            }
            catch
            {
                Response.Write("<script> alert ('Please select a valid Item ID to delete'); </script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Update Button
            try {
                if (Int32.Parse(TextBox1.Text) > 0)
                {
                    //Response.Write("Eligible for update");
                       if (DropDownList1.SelectedValue != "" && DropDownList2.SelectedValue != "" && DropDownList3.SelectedValue != "" && Int32.Parse(TextBox5.Text) >= 0 && Int32.Parse(TextBox6.Text) >= 0 && Int32.Parse(TextBox9.Text) >= 0 && TextBox2.Text != null && TextBox4.Text != null)
                       {
                           update();
                           GridView1.DataBind();
                       }
                       else {
                           Response.Write("<script> alert ('Please enter valid input values from the drop-down lists and in textboxes for the relavent properties'); </script>");
                       }
                }
                else {
                    Response.Write("<script> alert ('Please enter a valid Item ID to update");
                }
            }
            catch (Exception ex) {
                Response.Write("<script> alert ('Please enter a valid Item ID to update'); </script>");
            }
        }
        
        protected void Button19_Click(object sender, EventArgs e)
        {
            //Add Button
            try {

                if (DropDownList1.SelectedValue != "" && DropDownList2.SelectedValue != "" && DropDownList3.SelectedValue != "" && Int32.Parse(TextBox5.Text) >= 0 && Int32.Parse(TextBox6.Text) >= 0 && Int32.Parse(TextBox9.Text) >= 0 && TextBox2.Text != null && TextBox4.Text != null)
                {
                    if (checkItemExists())
                    {
                        Response.Write("<script> alert ('Item already exists!'); </script>");
                    }else
                    {
                        add();
                        GridView1.DataBind();
                        Response.Write("<script> alert ('New item added successfully'); </script>");
                    }
                }
            }
            catch
            {
                Response.Write("<script> alert ('Please enter valid Item Credentials'); </script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Edit Button

            Button19.Visible = true;
            Button4.Visible = true;
            Button5.Visible = true;

            TextBox1.ReadOnly = true;//Item no doesnt need to be passed. Table is Auto-incremented
            TextBox2.ReadOnly = false; //Item Name

            TextBox3.Visible = false; //Item Category
            DropDownList1.Visible = true;

            TextBox4.ReadOnly = false; //Item Description
            TextBox5.ReadOnly = false; //Item Cost
            TextBox6.ReadOnly = false; //Item Quantity

            TextBox7.Visible = false; //Item Avaiblability
            TextBox8.Visible = false; //Item Archived
            DropDownList2.Visible = true;
            DropDownList3.Visible = true;

            TextBox9.ReadOnly = false; //Item Threshold
        }

        protected void Button18_Click(object sender, EventArgs e)
        {
            //Cancel Button 
            TextBox1.Text = ""; //Item ID
            TextBox2.Text = ""; //Item Name
            TextBox3.Text = ""; //Item Category
            TextBox4.Text = ""; //Item Description
            TextBox5.Text = ""; //Item Cost
            TextBox6.Text = ""; //Item Quantity
            TextBox7.Text = ""; //Item Avaiblability
            TextBox8.Text = ""; //Item Archived
            TextBox9.Text = ""; //Item Threshold


            TextBox1.ReadOnly = false;
            TextBox2.ReadOnly = true; //Item Name

            TextBox3.Visible = true; //Item Category
            DropDownList1.Visible = false;

            TextBox4.ReadOnly = true; //Item Description
            TextBox5.ReadOnly = true; //Item Cost
            TextBox6.ReadOnly = true; //Item Quantity

            TextBox7.Visible = true; //Item Avaiblability
            TextBox8.Visible = true; //Item Archived
            DropDownList2.Visible = false;
            DropDownList3.Visible = false;

            TextBox9.ReadOnly = true; //Item Threshold
        }



        //Gridiew Buttons


        protected void Button6_Click(object sender, EventArgs e)
        {
            //All
            SqlDataSource4.SelectCommand = "Select * from S_Item";
            GridView1.DataBind();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //Confectionery
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Confectionery'";
            GridView1.DataBind();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //Cake
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Cake'";
            GridView1.DataBind();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //Pastry
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Pastry'";
            GridView1.DataBind();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            //Frozen
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Frozen'";
            GridView1.DataBind();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            //Savory
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Savory'";
            GridView1.DataBind();
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            //Drink
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Category='Drink'";
            GridView1.DataBind();
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            //Below Thresold
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Quantity < Item_Threshold";
            GridView1.DataBind();
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            //Available
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_AvailabilityStatus='Available'";
            Button14.Visible = false;
            Button15.Visible = true;
            GridView1.DataBind();
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            //Unavailable
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_AvailabilityStatus='Unavailable'";
            Button14.Visible = true;
            Button15.Visible = false;
            GridView1.DataBind();
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            //Archived
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Archived='true'";
            Button16.Visible = false;
            Button17.Visible = true;
            GridView1.DataBind();            
        }

        protected void Button17_Click(object sender, EventArgs e)
        {
           //Unarchived
            SqlDataSource4.SelectCommand = "Select * from S_Item where Item_Archived='false'";
            Button16.Visible = true;
            Button17.Visible = false;
            GridView1.DataBind();
        }


        //methods

        //SQL Methods
        public void getItemInformation()
        {

            String sql = "select * from S_Item where Item_ID = '" + TextBox1.Text.Trim() + "'";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read())
                    {
                        TextBox1.Text = dr.GetInt32(0).ToString(); //Item ID
                        TextBox2.Text = dr.GetValue(2).ToString(); //Item Name
                        TextBox3.Text = dr.GetValue(1).ToString(); //Item Category
                        TextBox4.Text = dr.GetValue(3).ToString(); //Item Description
                        DropDownList1.DataSource = dr.GetValue(1); //Item Category dropdownlist
                        //DropDownList4.DataValueField = "Item_Category";
                        //DropDownList4.DataBind();
                        //TextBox3.Text = dr.GetValue(3).ToString();
                        TextBox5.Text = dr.GetValue(4).ToString(); //Item Cost
                        TextBox6.Text = dr.GetValue(5).ToString(); //Item Quantity
                        TextBox7.Text = dr.GetValue(7).ToString(); //Item Avaiblability
                        TextBox8.Text = dr.GetValue(8).ToString(); //Item Archived
                        TextBox9.Text = dr.GetValue(6).ToString(); //Item Threshold

                    }
                }
            }
        }


        public void update()
        {

            String sql = "Update S_Item set Item_Category = @Item_Category, Item_Name = @Item_Name, Item_Description = @Item_Description, "+
                "Item_Price = @Item_Price, Item_Quantity = @Item_Quantity, Item_Threshold = @Item_Threshold, Item_AvailabilityStatus = @Item_AvailabilityStatus, "+
                "Item_Archived = @Item_Archived where Item_ID ='"+TextBox1.Text.Trim()+"'";
         
            //SqlDataSource6.SelectCommand = "Select * from S_Employee where Emp_ID='" + TextBox5.Text + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);


                //cmd.Parameters.AddWithValue("@Item_Category", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Category", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@Item_Name", TextBox2.Text.Trim());

                cmd.Parameters.AddWithValue("@Item_Description", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Price", Int32.Parse(TextBox5.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_Quantity", Int32.Parse(TextBox6.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_Threshold", Int32.Parse(TextBox9.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_AvailabilityStatus", DropDownList2.SelectedValue);
                cmd.Parameters.AddWithValue("@Item_Archived", DropDownList3.SelectedValue);


                cmd.ExecuteNonQuery();

            }
        }


        public void add()
        {

            string filepath = "~/iteminventory/menu-item-placeholder.png";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("iteminventory/" + filename));
            filepath = "~/iteminventory/" + filename;


            String sql = "insert into S_Item (Item_Category, Item_Name, Item_Description, Item_Price, Item_Quantity, Item_Threshold, Item_AvailabilityStatus, Item_Archived, Item_Image_Link) values (@Item_Category, @Item_Name, @Item_Description, @Item_Price, @Item_Quantity, @Item_Threshold, @Item_AvailabilityStatus, @Item_Archived, @Item_Image_Link)";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);


                cmd.Parameters.AddWithValue("@Item_Category", DropDownList1.SelectedValue);//TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Description", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Price", Int32.Parse(TextBox5.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_Quantity", Int32.Parse(TextBox6.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_Threshold", Int32.Parse(TextBox9.Text.Trim()));
                cmd.Parameters.AddWithValue("@Item_AvailabilityStatus", DropDownList2.SelectedValue);//TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Archived", DropDownList3.SelectedValue);//TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Item_Image_Link", filepath);
             
                cmd.ExecuteNonQuery();

            }
        }
        

        public void delete() {
            String sql = "UPDATE S_Item set Item_Archived='true' where Item_ID='" + TextBox1.Text.Trim() + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
        }


        bool checkItemExists() {

            String sql = "Select * from S_Item where Item_Name = '"+TextBox2.Text.Trim()+"'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    return true;
                }
                else
                {
                    return false;
             
                }

            }
        }


        //badge methods
        public void getBadgeDetail() {
            int quantity = Int32.Parse(TextBox6.Text);
            int threshold = Int32.Parse(TextBox9.Text);

            if (TextBox7.Text == "Available" && TextBox8.Text == "false" && quantity > threshold)
            {
                Label1.Text = "Available";
                Label1.CssClass = "badge rounded-pill bg-success";
            }
            else if (TextBox7.Text == "Available" && TextBox8.Text == "false" && quantity < threshold)
            {

                Label1.Text = "Available";
                Label1.CssClass = "badge rounded-pill bg-warning";
            }
            else if (TextBox7.Text == "Unavailable" && TextBox8.Text == "true")
            {
                Label1.Text = "Archived";
                Label1.CssClass = "badge rounded-pill bg-secondary";
            }
            else if (TextBox7.Text == "Unavailable")
            {
                Label1.Text = "Unavailable";
                Label1.CssClass = "badge rounded-pill bg-danger";
            }
            else
            {
                Label1.Text = "Archived";
                Label1.CssClass = "badge rounded-pill bg-secondary";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
         
        }
    }
}