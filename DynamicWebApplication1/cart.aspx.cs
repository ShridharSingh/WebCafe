using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace DynamicWebApplication1
{
    public partial class cart : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;
        int selectedIndex = 0;
        ArrayList activeWorker = new ArrayList();
       
        int selecteduantity = 1;
        int availablestock;
        bool valid = false;
     
        int selectedquantity;
        int total = 0;
        int creditsremaining = 180;
        int orderNo = 2;
        

        protected void Page_Load(object sender, EventArgs e)
        {

            //getCartLength();
            Label3.Text = DateTime.Today.Date.ToString();
            Label4.Text = DateTime.Now.ToString();

            try
            {
                if (Session["role"].Equals("employee"))
                {
                    //update();
                    GridView1.DataBind();
                    label1.Visible = true;
                    Label2.Visible = true;
                    TextBox8.Visible = true;
                    TextBox1.Visible = true;
                    updateCost();
                    getTotalCost();
                    TextBox8.Text = Session["crbal"].ToString();
                    creditsremaining = Int32.Parse(TextBox8.Text) - Int32.Parse(TextBox2.Text);
 
                    TextBox1.Text = creditsremaining.ToString();
                }
                else
                {
                }
            }
            catch (Exception ex) {
            }
            GridView1.DataBind();
            updateCost();
            getTotalCost();
         
            //TextBox2.Text = total.ToString();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //updateEmpBalance();
            //addToOrderItem();

         //   getOrderNo();
            //Response.Write("<script> alert ('Order No. " + orderNo + "');</script>");
           // getTotalCost();
            //Response.Write("<script> alert ('Total: " + total + "');</script>");

            try
            {
                if (Session["role"].Equals("employee"))
                {               
                    if (checkOverdraft())
                    {
                        Response.Write("<script> alert ('Warning! You have insufficient credits to complete this order. Should you wish to proceed using your overdraft please continue, else please clear cart'); </script>");
                        Button6.Visible = true;
                        Button5.Visible = true;
                        Button1.Visible = false;
                        Button3.Visible = false;
                    }
                    else {

                        checkParameters();
                        addToOrderItem();
                        updateEmpBalance();
                        updateItemQuantity();
                        updateAvailabilityStatus();
                        clearCart();
                        Response.Redirect("orderreceipt.aspx");
                    }
                }
                else {
                    Response.Write("<script> alert ('Please login before checkout');</script>");
                }                
            }
            catch (Exception ex) {
                Response.Write("<script> alert ('Please login before checkout');</script>");
            }
            //Response.Write("<script> alert ('"+amountavailable+"'); </script>");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals("employee"))
                {
                    if (checkOverdraft())
                    {
                        checkParameters();
                        addToOrderItem();
                        updateEmpBalance();
                        changeOverdraftStatus();
                        updateItemQuantity();
                        updateAvailabilityStatus();
                        clearCart();
                        Response.Redirect("orderreceipt.aspx");
                    }
             
                }
                else
                {
                    Response.Write("<script> alert ('Please login before checkout');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert ('Please login before checkout');</script>");
            }
            //Response.Write("<script> alert ('"+amountavailable+"'); </script>");
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            clearCart();
            GridView1.DataBind();
            Response.Write("<script> alert ('Cart is Cleared');</script>");
            total = 0;
            TextBox2.Text = total.ToString();
            try
            {
                TextBox1.Text = Session["crbal"].ToString();

            }
            catch (Exception ex) { }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RemoveButton_Click(object sender, EventArgs e) {
            selectedIndex = Convert.ToInt32((sender as Button).CommandArgument);
           
            delete();
            updateCost();
            getTotalCost();
            GridView1.DataBind();
            
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            selectedIndex = Convert.ToInt32((sender as Button).CommandArgument);
            inputtedValue();
  
           if (valid == true)
            {
                changequantity();
                updateCost();
                getTotalCost();
            }
            else {
               //Response.Write("<script> alert ('Oops There is an error'); </script>");
            }
            GridView1.DataBind();
        }



        public void inputtedValue() {

            if (Int32.Parse(DropDownList1.SelectedValue) == 0)
            {
                delete();
                updateCost();
                getTotalCost();             
            }           
            else 
            {         
                getParameters();
            }
        }



        public void getParameters()
        {
            String sql = "Select * from CART where Cart_ID ='" + selectedIndex + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                try
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            selecteduantity = dr.GetInt32(6);
                            availablestock = dr.GetInt32(7);
                            selectedquantity = Int32.Parse(DropDownList1.SelectedValue);
                        }
                        if (availablestock < selectedquantity)
                        {
                            Response.Write("<script> alert ('You have selected items more than currently in stock. Please reduce your purchase amount'); </script>");
                            valid = false;
                        }
                        else
                        {
                            valid = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                }

            }
        }

        public void changequantity()
        {
            if (Int32.Parse(DropDownList1.SelectedValue) > 0)
            {                
                String sql = "Update CART set Selected_Item_Quantity = @Selected_Item_Quantity where Cart_ID ='" + selectedIndex + "'";

                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@Selected_Item_Quantity", Int32.Parse(DropDownList1.SelectedValue));
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                }
                if (selectedIndex == 0)
                {
                    clearCart();
                }          
            }
            if (selectedIndex == 0)
            {
                clearCart();
            }
        }



        public void delete()
        {
            String sql = "Delete from CART where Cart_ID = '" + selectedIndex + "'";
            
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.ExecuteNonQuery();

            }
            GridView1.DataBind();
        }





        public void addToOrder()
        {
            getTotalCost();
            String sql = "insert into S_Order (Emp_ID, Order_Total, Order_Date, Order_Time, Order_Status) values " +
                " (@Emp_ID, @Order_Total, @Order_Date, @Order_Time, @Order_Status)";
            
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                
                SqlCommand cmd = new SqlCommand(sql, conn);
               
                cmd.Parameters.AddWithValue("@Emp_ID", Session["empid"]);
                cmd.Parameters.AddWithValue("@Order_Total", total);
                cmd.Parameters.AddWithValue("@Order_Date", DateTime.Today.Date.ToString());
                cmd.Parameters.AddWithValue("@Order_Time", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@Order_Status", "Placed");
              
                cmd.ExecuteNonQuery();
            }
        }





        public void addToOrderItem()
        {

            getOrderNo();
            updateCost();
            foreach (GridViewRow gr in GridView1.Rows)
            {
                String sql = "insert into S_OrderItem (Order_No, Item_ID, Quantity, UnitPrice, Subtotal) values (@Order_No, @Item_ID, @Quantity, @UnitPrice, @Subtotal)";

                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();
                                        
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.Parameters.AddWithValue("@Order_No", orderNo);
                    cmd.Parameters.AddWithValue("@Item_ID", gr.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@Quantity", gr.Cells[3].Text);
                    cmd.Parameters.AddWithValue("@UnitPrice", gr.Cells[5].Text);
                    cmd.Parameters.AddWithValue("@Subtotal", gr.Cells[6].Text);

                    cmd.ExecuteNonQuery();

                }
            }

        }



        public int getOrderNo()
        {
            String sql = "select Order_No from S_Order";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    ArrayList OrderNumbers = new ArrayList();
                  
                    orderNo = 2;
                    
                    while (dr.Read())
                    {
                        orderNo++;
                    }        
                }
            }
                    return orderNo;
        }



        public void checkParameters()
        {
            String sql = "Select * from CART";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                try
                {
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            selecteduantity = dr.GetInt32(6);
                            availablestock = dr.GetInt32(7);
                        }
                        if (availablestock < selecteduantity)
                        {
                            Response.Write("<script> alert ('You have selected items more than currently in stock. Please reduce your purchase amount'); </script>");
                        }
                        else
                        {
                            Response.Write("<script> alert ('Order has been processed. You will be redireced to view your Order receipt'); </script>");
                            addToOrder();
                           // addToOrderItem();
                        }
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }



        public void updateCost() {

            String sql = "Update CART set Subtotal = (Selected_Item_Quantity * Item_Price) where Cart_ID ='" + selectedIndex + "'";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
        }



        //define cost using arraylist
        public int getTotalCost()
        {
            String sql = "select Subtotal from CART";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    ArrayList calculateTotal = new ArrayList();
                    total = 0;
                    while (dr.Read())
                    {
                        int i = 0;
                        calculateTotal.Add(dr.GetValue(i));
                        total += dr.GetInt32(i);
                        i++;
                    }
                 
                    TextBox2.Text = total.ToString();

                    try
                    {
                        creditsremaining = Int32.Parse(TextBox8.Text) - Int32.Parse(TextBox2.Text);
                        TextBox1.Text = creditsremaining.ToString();
                    }
                    catch (Exception ex) {

                    }

                    //Response.Write("<script> alert ('"+total+"'); </script>");
                }
                else {
                    total = 0;
                    TextBox2.Text = total.ToString();
                }
            }
                return total;
        }


        public void clearCart()
        {

            String sql = "Truncate Table Cart";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                total = 0;
            }
        }






        public void updateEmpBalance() {
            String sql = "Update S_Employee set Emp_CrBalance = '" + creditsremaining+ "'where Emp_ID='"+Session["empid"]+"'";
         

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }

            Session["crbal"] = creditsremaining;
         
        }


        public void changeOverdraftStatus() {
            String sql = "Update S_Employee set Emp_Overdraft = 'true' where Emp_ID= '" + Session["empid"] + "'";


            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }

            Session["crbal"] = creditsremaining;

        }


        public bool checkOverdraft()
        {
            if (total > Int32.Parse(TextBox8.Text))
            {
                return true;

            }
            else
            {
                return false;
            }
        }

        

        public void updateItemQuantity()
        {

            foreach (GridViewRow gr in GridView1.Rows)
            {
                String sql = "update S_Item set Item_Quantity = (Item_Quantity - @Selected_Quantity) where Item_ID = @Item_ID";
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    
                    cmd.Parameters.AddWithValue("@Selected_Quantity", gr.Cells[3].Text);
                    cmd.Parameters.AddWithValue("@Item_ID", gr.Cells[0].Text);

                    cmd.ExecuteNonQuery();

                }
            }


        }

        public void updateAvailabilityStatus() {


            foreach (GridViewRow gr in GridView1.Rows)
            {
                String sql = "update S_Item set Item_AvailabilityStatus = 'Unavailable' where Item_Quantity = '0'";
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);

                    cmd.ExecuteNonQuery();

                }
            }

        }


        //Extras

















        //note: call add button code as a method in the menu page and store values in session vaiables or in data table and import that table into cart
        /*


        public void updateItemList() { 
            String sql = "select * from CART";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    //int i = 0;
                    while (dr.Read())
                    {
                        // i++;
                        
                        SqlDataSource1.UpdateCommand = "Update CART set Emp_ID = @Emp_ID where Cart_ID=''";
                        cmd.Parameters.AddWithValue("@Emp_ID", Session["empid"]);
                        cmd.ExecuteNonQuery();

                    }
                   // Response.Write(i);
                }
                conn.Close();
            }
        }



        public void getCartLength()
        {

            String sql = "select Cart_ID from CART";

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {

                    while (dr.Read())
                    {

                        cartindex++;

           

                    }
                }

                Response.Write(cartindex);
            }
        }



    public void update()
        {

            for (int i = 0; i<cartindex; i++) { 

            String sql = "Update CART set Emp_ID = @Emp_ID where Cart_ID='" + i + "'";
                //SqlDataSource6.SelectCommand = "Select * from S_Employee where Emp_ID='" + TextBox5.Text + "'";
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader dr = cmd.ExecuteReader();

                    cmd.Parameters.AddWithValue("@Emp_ID", Session["empid"]);


                    cmd.ExecuteNonQuery();






                }

            }
        }


   
       

    */




    }
}